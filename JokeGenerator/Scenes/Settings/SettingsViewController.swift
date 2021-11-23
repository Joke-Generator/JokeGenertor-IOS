//
//  SettingsViewController.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 17/08/2021.
//

import Foundation
import UIKit

protocol SettingsProtocol {
    
    func notification(alert : UIAlertController)
    func rateUs(rate: UIViewController)
    func setTheme(color: UIColor)
}

class SettingsViewController: UITableViewController,SettingsProtocol{
    
    var interactor : SettingsInteractorProtocol?
    var router : SettingsRouterProtocol?
    
    var delegate : SettingsControlDelegate?
    
    var keepCategories = UserDefaults.standard
    var keepNotification = UserDefaults.standard
    var keepTheme = UserDefaults.standard
    
    var selectedCategories : [String] = ["Misc","Programming","Dark","Pun","Spooky","Christmas"]
    
    var  sections = [
        Section(title: "Categories", options: ["Misc","Programming","Dark","Pun","Spooky","Christmas"]),
        Section(title: "Themes ", options: ["Dark", "Light"].compactMap({return "\($0) Mode"})),
//        Section(title: "Notifications", options: ["Once a day","Off","Custom"]),
        Section(title: "Notifications", options: ["Once a day","Off"]),
        Section(title: "Rate Us", options: [])
    ]
    
    var cells = [UIView]()
    
    override func viewDidLoad() {
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        setup()
        if keepCategories.array(forKey: UserDefaultKey.categories.rawValue) != nil{
            selectedCategories = (keepCategories.array(forKey: UserDefaultKey.categories.rawValue) as! [String])
        }
        if keepTheme.value(forKey: UserDefaultKey.theme.rawValue) == nil {
            keepTheme.set(Themes.LightMode.rawValue, forKey: UserDefaultKey.theme.rawValue)
        }
        let datePickerCell = DatePickerCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cells = [datePickerCell]
                
    }
    
    func setup(){
        let viewController = self
        let interactor = SettingsInteractor()
        let presenter = SettingsPresenter()
        let router = SettingsRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        interactor.checkTheme()
    }
    

    func setTheme(color: UIColor){
        view.backgroundColor = color
    }
    
    func notification(alert : UIAlertController) {
        present(alert, animated: true, completion: nil)
        
    }
    
    func rateUs(rate: UIViewController) {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        
        if section.isOpened{
            return section.options.count+1
        }
        else{
            return 1
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0  {
            sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
        }
                    
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.cellForRow(at: indexPath) {
            
            if indexPath.row != 0
            {
                // Category selection
                if cell.accessoryType.self == .checkmark
                {
                    if sections[indexPath.section].title == MenuList.Categories.rawValue {
                        selectedCategories = selectedCategories.filter { $0 != sections[indexPath.section].options[indexPath.row-1] }
                        keepCategories.setValue(selectedCategories, forKey: UserDefaultKey.categories.rawValue)
                        interactor?.allGroupCheckmark(cell: cell)
                    }
                }
                else if cell.accessoryType.self == .none
                {
                    if sections[indexPath.section].title == MenuList.Categories.rawValue {
                        selectedCategories.append(sections[indexPath.section].options[indexPath.row-1])
                        keepCategories.setValue(selectedCategories, forKey: UserDefaultKey.categories.rawValue)
                        interactor?.allGroupCheckmark(cell: cell)
                    }
                }
                //Theme Selection
                if sections[indexPath.section].options[indexPath.row-1] == Themes.DarkMode.rawValue {
                    interactor?.justOneCheckmark(cellType: .Themes, cell: cell, tableView: tableView)
                    delegate?.chanceThemeClicked(color: .black)
                    keepTheme.set(Themes.DarkMode.rawValue, forKey: UserDefaultKey.theme.rawValue)
                    view.backgroundColor = .lightGray
                    tableView.reloadData()
                }
                
                if sections[indexPath.section].options[indexPath.row-1] == Themes.LightMode.rawValue{
                    interactor?.justOneCheckmark(cellType: .Themes, cell: cell, tableView: tableView)
                    delegate?.chanceThemeClicked(color: .white)
                    keepTheme.set(Themes.LightMode.rawValue, forKey: UserDefaultKey.theme.rawValue)
                    view.backgroundColor = .white
                    tableView.reloadData()
                }
                
//                Notification Selection
                if sections[indexPath.section].options[indexPath.row-1] == NotificationType.OnceADay.rawValue{
                    interactor?.justOneCheckmark(cellType: .Notification, cell: cell, tableView: tableView)
                    interactor?.notification(option: .OnceADay)
                    keepNotification.set(NotificationType.OnceADay.rawValue, forKey: UserDefaultKey.notification.rawValue)
                }
                if sections[indexPath.section].options[indexPath.row-1] == NotificationType.Off.rawValue{
                    interactor?.justOneCheckmark(cellType: .Notification, cell: cell, tableView: tableView)
                    interactor?.notification(option: .Off)
                    keepNotification.set(NotificationType.Off.rawValue, forKey: UserDefaultKey.notification.rawValue)
                }
                if sections[indexPath.section].options[indexPath.row-1] == NotificationType.Custom.rawValue{
                    interactor?.justOneCheckmark(cellType: .Notification, cell: cell, tableView: tableView)
                    if (cell is DatePickerCell) {
                        let datePickerTableViewCell = cell as! DatePickerCell
                        datePickerTableViewCell.selectedInTableView(tableView)
                        self.tableView.deselectRow(at: indexPath, animated: true)
                    }
                    keepNotification.set(NotificationType.Custom.rawValue, forKey: UserDefaultKey.notification.rawValue)
                    interactor?.notification(option: .Custom)
                }
            }
            // Rate Us
            if sections[indexPath.section].title == MenuList.RateUs.rawValue{
                router?.rateUS()
            }
        }
        
        
        
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.layer.cornerRadius = cell.frame.height / 5
        cell.textLabel?.textColor = .black
        if indexPath.row == 0
        {
            cell.textLabel?.text = sections[indexPath.section].title
            if keepTheme.value(forKey: UserDefaultKey.theme.rawValue) as! String == Themes.DarkMode.rawValue {
                cell.backgroundColor = .darkGray
            }else{
                cell.backgroundColor = .systemOrange
            }
            cell.accessoryType = .none
        }
        else{
            cell.accessoryType = .none
            cell.textLabel?.text = sections[indexPath.section].options[indexPath.row-1]
            if keepTheme.value(forKey: UserDefaultKey.theme.rawValue) as! String == Themes.DarkMode.rawValue {
                cell.backgroundColor = .gray
            }
            else{
                cell.backgroundColor = .white
            }
            
            if sections[indexPath.section].title == MenuList.Categories.rawValue  {
                let tempList = keepCategories.array(forKey: UserDefaultKey.categories.rawValue)
                if tempList == nil {
                    cell.accessoryType = .checkmark
                }
                else{
                    for title in tempList! {
                        if sections[indexPath.section].options[indexPath.row-1] == title as! String {
                            cell.accessoryType = .checkmark
                        }
                    }
                }
            }
            if keepNotification.value(forKey: UserDefaultKey.notification.rawValue) == nil {
                keepNotification.set(NotificationType.Off.rawValue, forKey: UserDefaultKey.notification.rawValue)
                
            }
            if sections[indexPath.section].options[indexPath.row-1] == keepNotification.value(forKey: UserDefaultKey.notification.rawValue) as! String{
                cell.accessoryType = .checkmark
                
            }
            if sections[indexPath.section].options[indexPath.row-1] == keepTheme.value(forKey: UserDefaultKey.theme.rawValue) as! String {
                cell.accessoryType = .checkmark
            }
//            if sections[indexPath.section].options[indexPath.row-1] == NotificationType.Custom.rawValue{
//                return DatePickerCell()
//            }
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        let cell = self.tableView.cellForRow(at: indexPath)
        
//        if (cell is DatePickerCell) {
//            cell?.backgroundColor = .white
//            return (cell as! DatePickerCell).datePickerHeight()
//        }
        
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
}

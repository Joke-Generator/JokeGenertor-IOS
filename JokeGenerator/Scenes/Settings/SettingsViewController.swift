//
//  SettingsViewController.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 17/08/2021.
//

import Foundation
import UIKit

protocol SettingsProtocol {
    
    func selectCategories()
    func selectThemes()
    func notification(alert : UIAlertController)
    func rateUs()
}

class SettingsViewController: UITableViewController,SettingsProtocol{
    
    var interactor : SettingsInteractorProtocol?
    var router : SettingsRouterProtocol?
    
    var delegate : SettingsControlDelegate?
    
    var keepCategories = UserDefaults.standard
    var keepNotification = UserDefaults.standard

    
    var selectedCategories : [String] = ["Misc","Programming","Dark","Pun","Spooky","Christmas"]
    
    var cells = [UIView]()
    
    
    var  sections = [
        Section(title: "Categories", options: ["Misc","Programming","Dark","Pun","Spooky","Christmas"]),
        Section(title: "Themes ", options: ["Dark ", "Light "].compactMap({return "\($0) Mode"})),
        Section(title: "Notifications", options: ["Once a day","Off","Custom"]),
        Section(title: "Rate Us", options: [])
    ]
    
    override func viewDidLoad() {
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        setup()
        if keepCategories.array(forKey: UserDefaultKey.categories.rawValue) != nil{
            selectedCategories = (keepCategories.array(forKey: UserDefaultKey.categories.rawValue) as! [String])
        }
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
    }
    
    func selectCategories() {
        //
    }
    
    func selectThemes() {
        //
    }
    
    func notification(alert : UIAlertController) {
        present(alert, animated: true, completion: nil)
        
    }
    
    func rateUs() {
        //        
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
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.cellForRow(at: indexPath) {
            if indexPath.row != 0
            {
                if cell.accessoryType.self == .checkmark
                {
                    if sections[indexPath.section].title == MenuList.Categories.rawValue {
                        selectedCategories = selectedCategories.filter { $0 != sections[indexPath.section].options[indexPath.row-1] }
                        keepCategories.setValue(selectedCategories, forKey: UserDefaultKey.categories.rawValue)
                        interactor?.allGroupCheckmark(cell: cell)
//                        cell.accessoryType = .none

                    }
                }
                else if cell.accessoryType.self == .none
                {
                    if sections[indexPath.section].title == MenuList.Categories.rawValue {
                        selectedCategories.append(sections[indexPath.section].options[indexPath.row-1])
                        keepCategories.setValue(selectedCategories, forKey: UserDefaultKey.categories.rawValue)
                        interactor?.allGroupCheckmark(cell: cell)
//                        cell.accessoryType = .checkmark


                        
                    }
                }
            }
        }
        
        if indexPath.row == 0  {
            sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
            switch indexPath.section {
            case 0:
                print("Categories selected")
                print(SettingsViewController().keepCategories.value(forKey: UserDefaultKey.categories.rawValue)!)
            case 1:
                print("Themes selected")
            case 2:
                print("Notification selected")
            case 3:
                print("Rate us selected")
            default:
                print("out of range")
            }
        }
        else if indexPath.row == 1
        {
            switch indexPath.section {
            case 0:
                
                if let cell = tableView.cellForRow(at: indexPath) {
//                    interactor?.allGroupCheckmark(cell: cell)
                }
            case 1:
                if let cell = tableView.cellForRow(at: indexPath) {
                    interactor?.justOneCheckmark(cellType: .Themes, cell: cell, tableView: tableView)
                }
            case 2:
                print("Once a day ")
                if let cell = tableView.cellForRow(at: indexPath) {
                    
                    interactor?.justOneCheckmark(cellType: .Notification, cell: cell, tableView: tableView)
                    interactor?.notification(option: .OnceADay)
                    keepNotification.set(NotificationType.OnceADay.rawValue, forKey: UserDefaultKey.notification.rawValue)
                }
            default:
                print("out of range")
            }
        }
        else if indexPath.row == 2
        {
            switch indexPath.section {
            case 0:
                print("Music  ")
                if let cell = tableView.cellForRow(at: indexPath) {
//                    interactor?.allGroupCheckmark(cell: cell)
                }
            case 1:
                print("L'ght  Mode ")
                if let cell = tableView.cellForRow(at: indexPath) {
                    interactor?.justOneCheckmark(cellType: .Themes, cell: cell, tableView: tableView)
                    router?.changeBackground(image: "light.jpg")

                }
            case 2:
                print("Off ")
                if let cell = tableView.cellForRow(at: indexPath) {
                    interactor?.justOneCheckmark(cellType: .Notification, cell: cell, tableView: tableView)
                    interactor?.notification(option: .Off)
                    keepNotification.set(NotificationType.Off.rawValue, forKey: UserDefaultKey.notification.rawValue)
                }
            default:
                print("out of range")
            }
        }
        else if indexPath.row == 3
        {
            switch indexPath.section {
            case 0:
                print("programing   ")
                if let cell = tableView.cellForRow(at: indexPath) {
//                    interactor?.allGroupCheckmark(cell: cell)
                }
            case 2:
                let cell = self.tableView.cellForRow(at: indexPath)
                if (cell is DatePickerCell) {
                    let datePickerTableViewCell = cell as! DatePickerCell
                    datePickerTableViewCell.selectedInTableView(tableView)
                    self.tableView.deselectRow(at: indexPath, animated: true)
                    interactor?.notification(option: .Custom)
                    keepNotification.set(NotificationType.Custom.rawValue, forKey: UserDefaultKey.notification.rawValue)
                    interactor?.justOneCheckmark(cellType: .Notification, cell: cell!, tableView: tableView)

                }
            default:
                print("out of range")
            }
        }
        else if indexPath.row == 4
        {
            switch indexPath.section {
            case 0:
                print("Dark    ")

                if let cell = tableView.cellForRow(at: indexPath) {
//                    interactor?.allGroupCheckmark(cell: cell)
                    delegate?.chanceThemeClicked(name: "dark.jpg")

                }
            default:
                print("out of range")
            }
        }
        else if indexPath.row == 5
        {
            switch indexPath.section {
            case 0:
                print("Pun   ")
                if let cell = tableView.cellForRow(at: indexPath) {
//                    interactor?.allGroupCheckmark(cell: cell)
                }
            default:
                print("out of range")
            }
        }
        else if indexPath.row == 6
        {
            switch indexPath.section {
            case 0:
                print("Spooky    ")
                if let cell = tableView.cellForRow(at: indexPath) {
//                    interactor?.allGroupCheckmark(cell: cell)
                }
            default:
                print("out of range")
            }
        }
        else if indexPath.row == 7
        {
            switch indexPath.section {
            case 0:
                print("Crismas    ")
                if let cell = tableView.cellForRow(at: indexPath) {
//                    interactor?.allGroupCheckmark(cell: cell)
                }
            default:
                print("out of range")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.row == 0
        {
            cell.textLabel?.text = sections[indexPath.section].title
            cell.backgroundColor = .systemRed
            cell.accessoryType = .none
        }
        else{
            cell.accessoryType = .none
            cell.textLabel?.text = sections[indexPath.section].options[indexPath.row-1]
            cell.backgroundColor = .purple
            
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
                keepNotification.set("Off", forKey: UserDefaultKey.notification.rawValue)

            }
            if sections[indexPath.section].options[indexPath.row-1] == keepNotification.value(forKey: UserDefaultKey.notification.rawValue) as! String{
                cell.accessoryType = .checkmark

            }
            if sections[indexPath.section].options[indexPath.row-1] == NotificationType.Custom.rawValue{
                cell.backgroundColor = .gray
                return DatePickerCell()
            }
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == [2,3]{
            let cell = self.tableView.cellForRow(at: indexPath)
            
            if (cell is DatePickerCell) {
                cell?.backgroundColor = .green
                return (cell as! DatePickerCell).datePickerHeight()
            }
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
}

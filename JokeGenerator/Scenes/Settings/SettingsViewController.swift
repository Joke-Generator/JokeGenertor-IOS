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
    func rateUs(rate: UIViewController)
}

class SettingsViewController: UITableViewController,SettingsProtocol{
    
    var interactor : SettingsInteractorProtocol?
    var router : SettingsRouterProtocol?
    
    var delegate : SettingsControlDelegate?
    
    var keepCategories = UserDefaults.standard
    
    var selectedCategories : [String] = ["Misc","Programming","Dark","Pun","Spooky","Christmas"]
   
    var  sections = [
        Section(title: "Categories", options: ["Misc","Programming","Dark","Pun","Spooky","Christmas"].compactMap({return "\($0)"})),
        Section(title: "Themes ", options: ["Dark ", "Light "].compactMap({return "\($0) Mode "})),
        Section(title: "Notifications", options: ["Once a day","Off","Custom"].compactMap({return "\($0)"})),
        Section(title: "Rate Us", options: [].compactMap({return "Cell \($0)"})),
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
        //        <#code#>
    }
    
    func selectThemes() {
        //        <#code#>
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
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.cellForRow(at: indexPath) {
            if indexPath.row != 0
            {
                if cell.accessoryType.self == .checkmark
                {
                    if sections[indexPath.section].title == MenuList.Categories.rawValue {
                        selectedCategories = selectedCategories.filter { $0 != sections[indexPath.section].options[indexPath.row-1] }
                        keepCategories.setValue(selectedCategories, forKey: UserDefaultKey.categories.rawValue)
                    }
                }
                else if cell.accessoryType.self == .none
                {
                    if sections[indexPath.section].title == MenuList.Categories.rawValue {
                        selectedCategories.append(sections[indexPath.section].options[indexPath.row-1])
                        keepCategories.setValue(selectedCategories, forKey: UserDefaultKey.categories.rawValue)
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
                    interactor?.allGroupCheckmark(cell: cell)
                }
            case 1:
                if let cell = tableView.cellForRow(at: indexPath) {
                    interactor?.justOneCheckmark(cellType: .Themes, cell: cell, tableView: tableView)
                }


                delegate?.chanceThemeClicked(name: "dark.jpg")//sor burayi????

               

               // delegate?.chanceThemeClicked(name: "shrek")

            case 2:
                print("Once a day ")
                if let cell = tableView.cellForRow(at: indexPath) {
                    interactor?.justOneCheckmark(cellType: .Notification, cell: cell, tableView: tableView)
                    interactor?.notification(option: "Once a day")
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
                    interactor?.allGroupCheckmark(cell: cell)
                }
            case 1:
                print("L'ght  Mode ")
                if let cell = tableView.cellForRow(at: indexPath) {
                    interactor?.justOneCheckmark(cellType: .Themes, cell: cell, tableView: tableView)
                  //  interactor?.selectThemes()
            //        delegate?.chanceThemeClicked(name: "light.png")
                    router?.changeBackground(image: "light.jpg")
                    
                }
            case 2:
                print("Off ")
                if let cell = tableView.cellForRow(at: indexPath) {
                    interactor?.justOneCheckmark(cellType: .Notification, cell: cell, tableView: tableView)
                    interactor?.notification(option: "off")
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
                    interactor?.allGroupCheckmark(cell: cell)
                }
            case 2:
                print("costum  ")
                if let cell = tableView.cellForRow(at: indexPath) {
                    interactor?.justOneCheckmark(cellType: .Notification, cell: cell, tableView: tableView)
                    interactor?.notification(option: "custom")
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
                    interactor?.allGroupCheckmark(cell: cell)
                    interactor?.selectThemes()
                    delegate?.chanceThemeClicked(name: "dark.png")

                    
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
                    interactor?.allGroupCheckmark(cell: cell)
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
                    interactor?.allGroupCheckmark(cell: cell)
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
                    interactor?.allGroupCheckmark(cell: cell)
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
        }
        else{
            cell.textLabel?.text = sections[indexPath.section].options[indexPath.row-1]
            cell.backgroundColor = .cyan
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
        }
        return cell
    }
}

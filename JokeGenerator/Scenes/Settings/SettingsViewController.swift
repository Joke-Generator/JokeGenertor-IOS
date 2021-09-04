//
//  SettingsViewController.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 17/08/2021.
//

import Foundation
import UIKit

protocol SettingsProtocol {
    //
    //    func eventClicked(option : SettingOptions)
    func selectCategories()
    func selectThemes(theme:UIImage)
    func notification(alert : UIAlertController)
    func rateUs()
}

class SettingsViewController: UITableViewController,SettingsProtocol{
    
    var interactor : SettingsInteractorProtocol?
    var router : SettingsRouterProtocol?
    
    var  sections = [
        Section(title: "Categories ", options: ["Any","Misc","Programming","Dark","Pun","Spooky","Christmas"].compactMap({return " \($0)"})),
        Section(title: "Themes ", options: ["Dark ", "Light "].compactMap({return "\($0) Mode "})),
        Section(title: "Notifications ", options: ["Once a day","Off","Custom"].compactMap({return "\($0)"})),
        Section(title: "Rate Us", options: [].compactMap({return "Cell \($0)"})),
    ]
    
    override func viewDidLoad() {
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        setup()
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
    
    func selectThemes(theme:UIImage) {
        
    }
    func notification(alert : UIAlertController) {
       present(alert, animated: true, completion: nil)
        
    }
    
    func rateUs() {
        //        <#code#>
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
                    cell.accessoryType.self  = .none
                    //print("gel vatandas")
                }
                else if cell.accessoryType.self == .none
                {
                    cell.accessoryType.self = .checkmark
                   // print("burada tik islem' yapiliyor ")
                }
                
            }
            
            }
        
        if indexPath.row == 0  {
//self.interactor?.notification(option: "padawan")
            sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
            switch indexPath.section {
            case 0:
                print("Categories selected")
                print(indexPath)
            case 1:
                print("Themes selected")
            case 2:
                print("Notification selected")
                self.interactor?.notification(option: "padawan")
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
                print("Any ")
                print(indexPath)
            case 1:
                print("Dark Mode ")
              //  self.interactor?.selectThemes(theme: "Dark")
                router?.changeTheme(theme: UIImage(named: "shrek")!)

            case 2:
                print("Once a day ")
            default:
                print("out of range")
            }
        }
        else if indexPath.row == 2
        {
            switch indexPath.section {
            case 0:
                print("Music  ")
            case 1:
                print("L'ght  Mode ")
                print(indexPath)
            case 2:
                print("Off ")
            default:
                print("out of range")
            }
        }
        else if indexPath.row == 3
        {
            switch indexPath.section {
            case 0:
                print("programing   ")
            case 2:
                print("costum  ")
            default:
                print("out of range")
            }
        }
        else if indexPath.row == 4
        {
            switch indexPath.section {
            case 0:
                print("Dark    ")
            default:
                print("out of range")
            }
            
        }
        else if indexPath.row == 5
        {
            switch indexPath.section {
            case 0:
                print("Pun   ")
            default:
                print("out of range")
            }
            
        }
        else if indexPath.row == 6
        {
            switch indexPath.section {
            case 0:
                print("Spooky    ")
            default:
                print("out of range")
            }
            
        }
        else if indexPath.row == 7
        {
            switch indexPath.section {
            case 0:
                print("Crismas    ")
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
        }
        return cell
    }
}

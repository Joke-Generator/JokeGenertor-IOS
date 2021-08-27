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
    func selectThemes()
    func notification()
    func rateUs()
}

class SettingsViewController: UITableViewController,SettingsProtocol{
    
    var interactor : SettingsInteractorProtocol?
    var router : SettingsRouterProtocol?
    
    func selectCategories() {
//        <#code#>
    }
    
    func selectThemes() {
//        <#code#>
    }
    
    func notification() {
//        <#code#>
    }
    
    func rateUs() {
//        <#code#>
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
    
   
   var  sections = [
       Section(title: "Categories ", options: ["Misc","Programming","Dark","Pun","Spooky","Christmas"].compactMap({return " \($0)"})),
    Section(title: "Themes ", options: [].compactMap({return "Cell \($0)"})),
       Section(title: "Notifications ", options: [].compactMap({return "Cell \($0)"})),
    Section(title: "Rate Us", options: [].compactMap({return "Cell \($0)"})),
   ]
    
    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
        
       
        if indexPath.row == 0  {
            sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
        }
        else
        {
            
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

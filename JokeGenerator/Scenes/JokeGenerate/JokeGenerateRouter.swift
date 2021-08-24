//
//  JokeGenerateRouter.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 14/08/2021.
//

import Foundation
import SideMenu

protocol JokeGenerateRouterProtocol{
    func toSettings()
    
}

class  JokeGenerateRouter : NSObject, JokeGenerateRouterProtocol {
   
    var presenter : JokeGeneratePresenterProtocol?
   
    var viewController: JokeGenerateController?
    func toSettings() {
        var menu : SideMenuNavigationController?
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        viewController?.toSettings(menu: menu!)
        
        SideMenuManager.default.rightMenuNavigationController = menu
       // SideMenuManager.default.addPanGestureToPresent(toView: JokeGenerateController)
      //  presenter?.presentShare(share: activityCont, jokeObj: choosenJoke)
        print("bu bir denemedir")
    }
}

class MenuListController: UITableViewController{
   // var items = ["Categories","Themes","Notifications","Rate Us "]
    
  //  private var sections = [Section]()

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
            //self.tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
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

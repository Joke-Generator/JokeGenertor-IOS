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
    //
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
    var items = ["Categories","Themes","Notifications","Rate Us "]
    
    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
      // n
        
    }
}

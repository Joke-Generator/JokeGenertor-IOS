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
        menu = SideMenuNavigationController(rootViewController: SettingsViewController())
        viewController?.toSettings(menu: menu!)
        
        SideMenuManager.default.rightMenuNavigationController = menu
       
    }
}



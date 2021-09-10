//
//  JokeGenerateRouter.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 14/08/2021.
//

import Foundation
import SideMenu

protocol JokeGenerateRouterProtocol{
    func toSettings(menu : SideMenuNavigationController )
    
}

class  JokeGenerateRouter : NSObject, JokeGenerateRouterProtocol {
   
    var presenter : JokeGeneratePresenterProtocol?
    var viewController: JokeGenerateController?
    
    
    func toSettings(menu : SideMenuNavigationController) {
        viewController?.toSettings(menu: menu)
    }
}



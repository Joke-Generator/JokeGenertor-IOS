//
//  SettingsRouter.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 17/08/2021.
//

import Foundation
import UIKit

protocol SettingsRouterProtocol {
    //
    func toJokeGenerate()
    func changeTheme(theme:UIImage)
}

class SettingsRouter : SettingsRouterProtocol {
    
    var controller : JokeGenerateProtocol?
    var presenter : SettingsPresenterProtocol?
    var viewController : SettingsViewController?
    //jokegenerate baglanmak lazim router
    func toJokeGenerate(){
        //to main view
        
        
    }
    func changeTheme(theme:UIImage){
        controller?.changeBackground(theme: theme)
        print("route")
        print( controller?.changeBackground(theme: theme))
        JokeGenerateController().changeBackground(theme: theme)
        print( controller?.changeBackground(theme: theme))

    }
}

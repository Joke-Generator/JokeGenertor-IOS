//
//  SettingsRouter.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 17/08/2021.
//

import Foundation

protocol SettingsRouterProtocol {
    //
    func toJokeGenerate()
}

class SettingsRouter : SettingsRouterProtocol {
    
    var presenter : SettingsPresenterProtocol?
    var viewController : SettingsViewController?
    
    func toJokeGenerate(){
        //to main view
        
    }
}

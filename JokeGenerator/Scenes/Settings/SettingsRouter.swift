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
    func changeBackground(image:String) 
   
   
}

class SettingsRouter : SettingsRouterProtocol {
    
    var presenter : SettingsPresenterProtocol?
    var viewController : SettingsViewController?
    
    func toJokeGenerate(){
        //to main view
        
    }
    func changeBackground(image:String){
        viewController?.delegate?.chanceThemeClicked(name: image)
    }
    
    
}

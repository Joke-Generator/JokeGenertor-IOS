//
//  SettingsInteractor.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 17/08/2021.
//

import Foundation


protocol SettingsInteractorProtocol {
    //
    func selectCategories()
    func selectThemes()
    func notification()
    func rateUs()
    
}

class SettingsInteractor : SettingsInteractorProtocol{
    
    var presenter : SettingsPresenterProtocol?
    var worker : SettingsWorkerProtocol?
    
    
    func selectCategories() {
        //
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
    
  
    
}

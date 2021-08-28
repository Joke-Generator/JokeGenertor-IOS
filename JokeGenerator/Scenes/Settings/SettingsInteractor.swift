//
//  SettingsInteractor.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 17/08/2021.
//

import Foundation
import UserNotifications


protocol SettingsInteractorProtocol {
    //
    func selectCategories()
    func selectThemes()
    func notification(option: String)
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
    
    func notification(option : String) {
        print("yeay from interactor")
        presenter?.presentNotification(title: "Yeayy", message: "Padawanus")
        switch option {
        case "Once a day":
            presenter?.presentNotification(title: "Once a day", message: "Your notifications will send at once a day")
        case "off":
            presenter?.presentNotification(title: "Off", message: "Your notifications closed")
        case "custom":
            
            presenter?.presentNotification(title: "Custom", message: "Your notifications will send at chosen time")
        default:
            print("No, I'm your father")
        }
        
    }
    
    func rateUs() {
//        <#code#>
    }
    
  
    
}

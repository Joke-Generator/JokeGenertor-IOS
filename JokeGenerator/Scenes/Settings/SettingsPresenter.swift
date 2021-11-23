//
//  SettingsPresenter.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 17/08/2021.
//

import Foundation
import UIKit

protocol SettingsPresenterProtocol {
  
    func presentNotification(title : String, message : String)
    func presentRateUs(rate: UIViewController)
    func presentTheme(color : UIColor)
}

class SettingsPresenter: SettingsPresenterProtocol {
    
    
    
    var viewController : SettingsProtocol?
    

    
    func presentTheme(color : UIColor){
        viewController?.setTheme(color: color)
    }
    
    func presentRateUs(rate: UIViewController) {
        
        viewController?.rateUs(rate: rate)

    }
    func presentNotification(title : String, message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        viewController?.notification(alert: alert)
    }
    
    //
}

//
//  SettingsPresenter.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 17/08/2021.
//

import Foundation
import UIKit

protocol SettingsPresenterProtocol {
    //
    func presentSettings()
    func presentNotification(title : String, message : String)
    func presentRateUs(rate: UIViewController)
}

class SettingsPresenter: SettingsPresenterProtocol {
    
    func presentRateUs(rate: UIViewController) {
        
        viewController?.rateUs(rate: rate)
    }
    
    var viewController : SettingsProtocol?
    
    func presentSettings() {
//        <#code#>
    }
    func presentNotification(title : String, message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        viewController?.notification(alert: alert)
    }
    
    //
}

//
//  SettingsInteractor.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 17/08/2021.
//

import Foundation
import UserNotifications
import UIKit



protocol SettingsInteractorProtocol {
    //
    func selectCategories()
    //func selectThemes(theme:String)
    func notification(option: String)
    func rateUs()
    
}

class SettingsInteractor : SettingsInteractorProtocol{
    
    var presenter : SettingsPresenterProtocol?
    var worker : SettingsWorkerProtocol?
    
    var customHour = UserDefaults.standard
    var customMinute = UserDefaults.standard
    var controller: JokeGenerateProtocol?

    
    func selectCategories() {
        //
    }
    
//    func selectThemes(theme :String){
//
//        switch theme {
//        case "Dark":
//            controller?.changeBackground(theme: "dark")
//            print("hey")
//            presenter?.presentTheme(theme: UIImage(named: "dark")!)
//
//
//        case "Light":
//            controller?.changeBackground(theme: "light.jpg")
//
//
//        default:
//            print("no image")
//
//        }
       
 //   }
    
    func notification(option : String) {
        presenter?.presentNotification(title: "Yeayy", message: "Padawanus")
        switch option {
        case "Once a day":
            sendNotification(hour: 15, minute: 00)
            presenter?.presentNotification(title: "Once a day", message: "Your notifications will send at once a day")
        case "off":
            let center = UNUserNotificationCenter.current()
            center.removeAllPendingNotificationRequests()
            presenter?.presentNotification(title: "Off", message: "Your notifications closed")
        case "custom":
            sendNotification(hour: customHour.integer(forKey: "Hour"), minute: customMinute.integer(forKey: "Minute"))
            presenter?.presentNotification(title: "Custom", message: "Your notifications will send at chosen time")
        default:
            print("No, I'm your father")
        }
        
    }
    
    func rateUs() {
//        <#code#>
    }
    
    func sendNotification(hour: Int, minute: Int){
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        let content = UNMutableNotificationContent()
        content.title = "Late wake up call"
        content.body = "The early bird catches the worm, but the second mouse gets the cheese."
        content.categoryIdentifier = "alarm"
        //           content.userInfo = ["customData": "fizzbuzz"]
        content.sound = UNNotificationSound.default
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }
    
  
    
}

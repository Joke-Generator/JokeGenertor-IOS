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
    func selectThemes()
    func notification(option: NotificationType)
    func rateUs()
    func allGroupCheckmark(cell: UITableViewCell  )
    func justOneCheckmark (cellType :cellCheckmarkType , cell : UITableViewCell , tableView : UITableView  )
    
}

class SettingsInteractor : SettingsInteractorProtocol{
    
    var presenter : SettingsPresenterProtocol?
    var worker : SettingsWorkerProtocol?
    
    var customTime = UserDefaults.standard
    
    
    func selectCategories() {
        //
    }
    
    func selectThemes() {
//        <#code#>
    }
    
    func notification(option : NotificationType) {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        switch option {
        case .OnceADay:
            sendNotification(hour: 15, minute: 00)
            presenter?.presentNotification(title: "Once a day", message: "Your notifications will send at once a day")
        case .Off:
            presenter?.presentNotification(title: "Off", message: "Your notifications closed")
        case .Custom:
            sendNotification(hour: customTime.integer(forKey: "Hour"), minute: customTime.integer(forKey: "Minute"))
            presenter?.presentNotification(title: "Custom", message: "Your notifications will send at chosen time")
        }
        
    }
    
    func rateUs() {
//        <#code#>
    }
    
    func sendNotification(hour: Int, minute: Int){
        let joke = JokeGenerateWorker().fetch()
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        let content = UNMutableNotificationContent()
        content.title = "Late wake up call"
        content.body = joke.joke
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
    
    func justOneCheckmark (cellType :cellCheckmarkType , cell : UITableViewCell , tableView : UITableView  )
    {
        let themesCell = [[1,  1],  [1,  2]]
        let notificationsCell = [[2,  1], [2, 2], [2,  3]]
        
        switch cellType{
        case .Themes:
            let cellnumber = tableView.indexPath(for: cell)!
           
            for theme in themesCell {
                
                if cellnumber.elementsEqual(theme)
                {
                    cell.accessoryType = .checkmark
                }
                else
                {
                    tableView.cellForRow(at: IndexPath(indexes: theme))?.accessoryType = .none
                }
    
            }
        case .Notification:
            let cellnumber = tableView.indexPath(for: cell)!
            
            for notification in notificationsCell {
                
                if notification.elementsEqual(cellnumber)
                {
                    cell.accessoryType.self = .checkmark
                }
                else 
                {
                    tableView.cellForRow(at: IndexPath(indexes: notification))?.accessoryType = .none
                }
            }
        }
    }
    
    func allGroupCheckmark(cell: UITableViewCell  )
    {
        if cell.accessoryType.self == .checkmark
        {
            cell.accessoryType.self  = .none
        }
        else if cell.accessoryType.self == .none
        {
            cell.accessoryType.self = .checkmark
        }
        
    }
  
    
}

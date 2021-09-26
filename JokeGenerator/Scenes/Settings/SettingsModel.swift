//
//  SettingsModel.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 17/08/2021.
//

import Foundation
import UIKit


protocol SettingsControlDelegate {
    func chanceThemeClicked(name: String)
}

class Section{
    let title: String
    let options:[String]
    var isOpened : Bool = false
    init(title: String,
         options:[String],
         isOpened : Bool = false) {
        self.title = title
        self.options = options
        self.isOpened = isOpened
        
    }
}

enum JokesCategory : String {
    
    case Misc = "Miscellaneous"
    case Programming = "Programming"
    case Dark = "Dark"
    case Pun = "Pun"
    case Spooky = "Spooky"
    case Christmas = "Christmas"
}

enum MenuList : String {
    case Categories = "Categories"
    case Themes = "Themes"
    case Notifications = "Notifications"
    case RateUs = "Rate Us"
}

enum NotificationType : String {
    case OnceADay = "Once a day"
    case Off = "Off"
    case Custom = "Custom"
}

enum cellCheckmarkType{
    case Themes
    case Notification
}

enum UserDefaultKey : String {
    case categories = "selected"
    case notification = "notification"
    case hour = "Hour"
    case minute = "Minute"
    
    
}

extension UIToolbar {
    
    func ToolbarPiker(mySelect : Selector) -> UIToolbar {
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: mySelect)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        return toolBar
    }
    
}

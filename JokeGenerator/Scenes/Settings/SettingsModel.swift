//
//  SettingsModel.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 17/08/2021.
//

import Foundation



protocol SettingsControlDelegate {
    
    func chanceThemeClicked(name: String)
    func rateUs()
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
    case Custom = "Custom"
    case Off = "Off"
    case OnceADay = "Once a day"
    
}

enum Themes : String {
    case DarkMode = "Dark Mode"
    case LightMode = "Light Mode"
}

enum cellCheckmarkType{
    
    case Themes
    case Notification
}

enum UserDefaultKey : String {
    
    case categories = "selected"
    case notification = "notification"
    case background = "image"
    case hour = "Hour"
    case minute = "Minute"
}








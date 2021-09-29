//
//  SettingsModel.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 17/08/2021.
//

import Foundation


struct Settings
{
//    var category = Category[Categorys.JokesCategory]
    var themes = Themes.self
    var notification = Bool.self
    
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

enum Themes
{
    case Yellow
    case Blue
    case Black
    case Green
    case AddOther
}

protocol SettingsControlDelegate {
    func chanceThemeClicked(name: String)
}

enum cellCheckmarkType{
    case Themes
    case Notification
}

enum UserDefaultKey : String {
    case categories = "selected"
    case notification = "notification"
}
//enum SettingOptions {
//    case categories
//    case themas
//    case notification
//    case rateUs
//}

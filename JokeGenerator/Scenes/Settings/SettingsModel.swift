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
struct Categorys
{
    
    enum JokesCategory
    {
        // Burada default olarak any secerek de baslaya biliriz General sadece OfficalJoke da olacal onu ozellille ayirmak gerek var mi tam dusunemedim acikcasi
        case Misc
        case Programming
        case Dark
        case Pun
        case Spooky
        case Christmas
       
    }
//    var Category = [JokesCategory].self
    
}

// emin olmamakla beraber
enum Themes
{
    case Yellow
    case Blue
    case Black
    case Green
    case AddOther
}
//enum SettingOptions {
//    case categories
//    case themas
//    case notification
//    case rateUs
//}

//
//  JokeGenerateWorker.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 16/08/2021.
//

import Foundation
import UIKit

protocol JokeGenerateWorkerProtocol {
    func fetch() -> GeneralJoke
}

class JokeGenerateWorker : JokeGenerateWorkerProtocol  {
    
    func fetch() -> GeneralJoke{
        
        let tempSelected = SettingsViewController().keepCategories.value(forKey: UserDefaultKey.categories.rawValue) as? [String]
        
        var tempCategories = ["Any"]
        if  tempSelected != nil && tempSelected != []{
                   tempCategories = SettingsViewController().keepCategories.value(forKey: UserDefaultKey.categories.rawValue) as! [String]
               }

        var categories = ""
        for i in 0...tempCategories.count-1 {
            if i == tempCategories.count-1{
                categories += "\(tempCategories[i])"
            }else{
                categories += "\(tempCategories[i]),"
            }
        }
        let temp = NetworkManager().fetchJoke(categories: categories)
        
        
        
        return temp
    }
}

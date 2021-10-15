//
//  JokeGenerateWorker.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 16/08/2021.
//

import Foundation


class JokeGenerateWorker  {
    
    func fetch(complation : @escaping (GeneralJoke) -> Void ) -> GeneralJoke{
        var tempCategories : [String]
        if SettingsViewController().keepCategories.value(forKey: UserDefaultKey.categories.rawValue) != nil{
            tempCategories = SettingsViewController().keepCategories.value(forKey: UserDefaultKey.categories.rawValue) as! [String]
        }
        else{
            tempCategories = ["Any"]
        }
        
        
        var categories = ""
        var isChristmas = true
        for i in 0...tempCategories.count-1 {
           if i == tempCategories.count-1{
                categories += "\(tempCategories[i])"
            }else{
                categories += "\(tempCategories[i]),"
            }
            if tempCategories[i] == JokesCategory.Christmas.rawValue {
                isChristmas = false
          }
        }
        var temp : GeneralJoke? = nil
  
        var random = Int.random(in: 0...10)
        random = 2
        if random<5{
            JokeGenerateService().getSingleJoke { joke in
                complation(joke)
            }

            
        }
//        else{
//            JokeGenerateService().getTwoPartJoke(category: categories) { joke in
//                temp = joke
//            }
//
//        }
        
        return temp ?? GeneralJoke(joke: "Yeay", category: "Patates")
    }
}

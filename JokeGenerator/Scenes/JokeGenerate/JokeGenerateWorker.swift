//
//  JokeGenerateWorker.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 16/08/2021.
//

import Foundation


class JokeGenerateWorker  {
    
    func fetch() -> GeneralJoke{
        
        var tempCategories = ["Any"]
        if SettingsViewController().keepCategories.value(forKey: UserDefaultKey.categories.rawValue) != nil {
            print(SettingsViewController().keepCategories.value(forKey: UserDefaultKey.categories.rawValue)!)
            tempCategories = SettingsViewController().keepCategories.value(forKey: UserDefaultKey.categories.rawValue) as! [String]
        }
        var categories = ""
//        var isChristmas = true
        for i in 0...tempCategories.count-1 {
            if i == tempCategories.count-1{
                categories += "\(tempCategories[i])"
            }else{
                categories += "\(tempCategories[i]),"
            }
//            if tempCategories[i] == JokesCategory.Christmas.rawValue {
//                isChristmas = false
//            }
        }
        var temp : GeneralJoke? = nil
        let semaphore = DispatchSemaphore (value: 0)
        let randomNum = Int.random(in: 0..<10)
        var request : URLRequest
//        if randomNum < 5 && isChristmas
        if randomNum < 5{
            request = URLRequest(url: URL(string: "https://v2.jokeapi.dev/joke/\(categories)?type=\(JokeType.single)")!,timeoutInterval: Double.infinity)
            request.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print(String(describing: error))
                    return
                }
                var joke : JokeSingle
                do{
                    joke  = try JSONDecoder().decode(JokeSingle.self, from : data)
                    temp = GeneralJoke(joke: joke.joke, category: joke.category)
                }catch{
                    print(error)
                }
                semaphore.signal()
            }
            task.resume()
            semaphore.wait()
        }
        else{
            request = URLRequest(url: URL(string: "https://v2.jokeapi.dev/joke/\(categories)?type=\(JokeType.twoPart)")!,timeoutInterval: Double.infinity)
            request.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print(String(describing: error))
                    return
                }
                var joke : JokeTwoPart
                do{
                    joke  = try JSONDecoder().decode(JokeTwoPart.self, from : data)
                    temp = GeneralJoke(joke: "\(joke.setup) \n\(joke.delivery)", category: joke.category)
                }catch{
                    print(error)
                }
                semaphore.signal()
            }
            task.resume()
            semaphore.wait()
        }
        
        
        return temp!
    }
}


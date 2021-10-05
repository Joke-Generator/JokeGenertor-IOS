//
//  JokeGeneratorAPI.swift
//  JokeGenerator
//
//  Created by Serra Saracoglu on 04/10/2021.
//

import Foundation
import Alamofire
//Requestlerimizi başlatmak için AF. request’e baseUrl+gitmek istediğimiz yolu yazarak request yapılacak yeri belirliyoruz.

private var categories = "Any"

private let singleJoke = "https://v2.jokeapi.dev/joke/\(categories)?type=\(JokeType.single)"
private let twoPart = "https://v2.jokeapi.dev/joke/\(categories)?type=\(JokeType.twoPart)"


var temp : GeneralJoke? = nil

typealias JokeResponseCompletion = () -> JokeSingle
typealias JokeResponseCompletion2 = () -> JokeTwoPart

class JokeGenerateService {
    
    // MARK: - Alamofire get request
    
    func getSingleJoke(category:String)->GeneralJoke {
        categories = category
        AF.request(singleJoke).response { response in
//            debugPrint(response)
            
            switch response.result {
            case .success(let data):
                var joke : JokeSingle
                do{
                    joke  = try JSONDecoder().decode(JokeSingle.self, from : (response.data)!)
                    temp = GeneralJoke(joke: joke.joke, category: joke.category)
                    print(temp?.joke)
                }catch{
                    print(error)
                }
            case .failure(let error):
                print("Something went wrong: \(error)")
            default:
                      print("calis")
            }
            
          
         //   debugPrint(response.result)
        }
        return temp!
    }
    
    func getTwoPartJoke(category : String) -> GeneralJoke{
        categories = category
        AF.request(twoPart).response { response in
         //   debugPrint(response)
            switch response.result {
            case .success(let data):
                var joke2 : JokeTwoPart
                do{
                    joke2  = try JSONDecoder().decode(JokeTwoPart.self, from : response.data!)
                    temp = GeneralJoke(joke: "\(joke2.setup) \n\(joke2.delivery)", category: joke2.category)
                    
                }catch{
                    
                    print(error)
                }
            case .failure(let error):
                print("Something went wrong: \(error)")
            }
            
            debugPrint(response.result)
        }
        
        return temp!
    }
    //    Session.default.request(randomURL).responseJSON { response in
    
    
    
    
    
    //
    
    
    
    
    
}

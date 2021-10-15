//
//  JokeGeneratorAPI.swift
//  JokeGenerator
//
//  Created by Serra Saracoglu on 04/10/2021.
//

import Foundation
import Alamofire
//Requestlerimizi başlatmak için AF. request’e baseUrl+gitmek istediğimiz yolu yazarak request yapılacak yeri belirliyoruz.



var categories = "Any"

var singleJoke = "https://v2.jokeapi.dev/joke/\(categories)?type=single)"

var temp : GeneralJoke? = nil

typealias JokeResponseCompletion = () -> JokeSingle
typealias JokeResponseCompletion2 = () -> JokeTwoPart

class JokeGenerateService {
    
    
    // MARK: - Alamofire get request
    
//    func getSingleJoke(category:String, complation:(GeneralJoke)->Void) {
//        let dispatchGroup = DispatchGroup()
//
//        var singleJoke = "https://v2.jokeapi.dev/joke/\(category)?type=\(JokeType.single)"
//        categories = category
//        dispatchGroup.enter()
//        AF.request(singleJoke).response { response in
//            debugPrint(response)
//            switch response.result {
//
//            case .success(let data):
//
//                var joke2 : JokeSingle
//                do{
//                    joke2  = try JSONDecoder().decode(JokeSingle.self, from : response.data!)
//                    temp = GeneralJoke(joke: joke2.joke ,category: joke2.category)
//                    print(joke2.category)
//
//                }catch{
//
//                    print(error.localizedDescription)
//                }
//                complation(temp!)
//            case .failure(let error):
//                print("Something went wrong: \(error)")
//            }
//
//            debugPrint(response.result)
//            dispatchGroup.leave()
//        }
//
//        return temp ?? GeneralJoke(joke: "Welcom Shall We Start", category: "PAtates")
//    }
//
//    func getTwoPartJoke(category : String, complation:(GeneralJoke)->Void){
//        categories = category
//        let twoPart = "https://v2.jokeapi.dev/joke/\(categories)?type=\(JokeType.twoPart)"
//        AF.request(twoPart).response { response in
//            debugPrint(response)
//            switch response.result {
//            case .success(_):
//                var joke2 : JokeTwoPart
//                do{
//                    joke2  = try JSONDecoder().decode(JokeTwoPart.self, from : response.data!)
//                    temp = GeneralJoke(joke: "\(joke2.setup) \n\(joke2.delivery)", category: joke2.category)
//                    print(joke2.category)
//                    complation(temp!)
//                }catch{
//
//                    print(error)
//                }
//            case .failure(let error):
//                print("Something went wrong: \(error)")
//            }
//
//            debugPrint(response.result)
//        }
//
//        return temp ?? GeneralJoke(joke: "Welcom Shall We Start", category: "PAtates")
//    }
    
//    func getJoke(completionHandler:(GeneralJoke) -> ()) -> (){
//        AF.request(singleJoke).response { response in
//            switch response.result {
//            case .success(_):
//                joke2  = try JSONDecoder().decode(JokeSingle.self, from : response.data!)
//                temp = GeneralJoke(joke: joke2.joke ,category: joke2.category)
////                completionHandler(temp)
//            case .failure(_):
//                print(error)
//            }
//
//
//        }
//    }
    func getSingleJoke( closure: @escaping (GeneralJoke) -> Void) {
        // function body goes here
        AF.request(singleJoke).response { response in
            debugPrint(response)
            switch response.result {
            case .success(_):
                var joke2 : JokeTwoPart
                do{
                    joke2  = try JSONDecoder().decode(JokeTwoPart.self, from : response.data!)
                    temp = GeneralJoke(joke: "\(joke2.setup) \n\(joke2.delivery)", category: joke2.category)
                    print(joke2.category)
                    closure(temp!)
                }catch{
                    
                    print(error)
                }
            case .failure(let error):
                print("Something went wrong: \(error)")
            }
            
            debugPrint(response.result)
        }
    }
    
    
    
    
    
    //
    
    
    
    
    
}

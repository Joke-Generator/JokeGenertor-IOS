
//  JokeGenerateWorker.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 16/08/2021.
//
import Foundation

class JokeGenerateWorker  {
    
    func fetch() -> GeneralJoke{
        var temp : GeneralJoke? = nil
        let semaphore = DispatchSemaphore (value: 0)
        let randomNum = Int.random(in: 0..<10)
        var request : URLRequest
        if randomNum < 5{
            request = URLRequest(url: URL(string: "https://v2.jokeapi.dev/joke/Programming,Miscellaneous,Dark,Pun,Spooky,Christmas?type=\(JokeType.single)")!,timeoutInterval: Double.infinity)
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
            request = URLRequest(url: URL(string: "https://v2.jokeapi.dev/joke/Programming,Miscellaneous,Dark,Pun,Spooky,Christmas?type=\(JokeType.twoPart)")!,timeoutInterval: Double.infinity)
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

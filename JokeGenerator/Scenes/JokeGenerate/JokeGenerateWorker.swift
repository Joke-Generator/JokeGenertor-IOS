//
//  JokeGenerateWorker.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 16/08/2021.
//

import Foundation


class JokeGenerateWorker  {
    
    func fetch() -> Joke{
        var temp : Joke? = nil
        let semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "https://v2.jokeapi.dev/joke/Programming,Miscellaneous,Dark,Pun,Spooky,Christmas?type=single")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            do{
                var joke : Joke
//                print(String(data: data, encoding: .utf8)!)
                do{
                    joke  = try JSONDecoder().decode(Joke.self, from : data)
                    print(joke.joke)
                    
                    temp = joke
                }catch{
                    print(error)
                }
                //                print(joke.joke)
                print("yeay")
                
                
                
            }catch{
                print(error.localizedDescription)
            }
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        print(" \(String(describing: temp?.joke)) buuuuu ")
        return temp!
    }
}

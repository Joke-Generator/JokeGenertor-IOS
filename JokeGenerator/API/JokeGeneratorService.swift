import Foundation
import Alamofire
//Requestlerimizi başlatmak için AF. request’e baseUrl+gitmek istediğimiz yolu yazarak request yapılacak yeri belirliyoruz.

private let randomURL = "https://v2.jokeapi.dev/joke/Programming,Miscellaneous,Dark,Pun,Spooky,Christmas?type=\(JokeType.single)"
var temp : GeneralJoke? = nil

typealias JokeResponseCompletion = () -> JokeSingle
class JokeAPI {

// MARK: - Alamofire get request
    
    func getMethod() {

        AF.request(randomURL).response { response in
            debugPrint(response)
            
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
            }

            debugPrint(response.result)
        }
}
        }
    //    Session.default.request(randomURL).responseJSON { response in

           
    
    

//
        
     

        

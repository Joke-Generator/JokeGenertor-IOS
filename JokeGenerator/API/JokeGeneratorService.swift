//import Foundation
//import Alamofire
////Requestlerimizi başlatmak için AF. request’e baseUrl+gitmek istediğimiz yolu yazarak request yapılacak yeri belirliyoruz.
//
//private let randomURL = "https://v2.jokeapi.dev/joke/Programming,Miscellaneous,Dark,Pun,Spooky,Christmas?type=\(JokeType.single)"
//typealias JokeResponseCompletion = () -> JokeSingle
//class JokeAPI {
//
//// MARK: - Alamofire get request
//    
//func alamofireFetch(completion: @escaping JokeResponseCompletion) {
//        AF.request(randomURL, method: .get )
//            .validate()
//            .responseJSON { dataResponse in
//                switch dataResponse.result {
//                case .success(let value):
//                    guard let jokeSingle_ = value as? [String: Any] else {return}
//                    DispatchQueue.main.async {
//                   let randomJoke = self.parseJoke(json: jokeSingle_)
//          //          completion(randomJoke)
//                        print(jokeSingle_)
//                    }
//                case .failure(let error):
//                    print(error)
//                }
//            }
//    }
//    
//
//// MARK: - JSON parsin method
//
//private func parseJoke(json: [String: Any]) -> JokeSingle {
//    let error = json["error"] as? Bool ?? true
//    let category = json["category"] as? String ?? ""
//    let type = json["type"] as? String ?? ""
//    let joke = json["joke"] as? String ?? ""
//    let flags = json["flags"] as? [Flags]?
//    let id = json["id"] as? Int ?? 1
//    let safe = json["safe"] as? Bool ?? true
//    let lang = json["lang"] as? String ?? ""
//
//   //let jokeSingle_ = JokeSingle(error:error, category: category, type: type, joke: joke, flags:flags!, id:id,safe: true,lang: "")
//
//    return jokeSingle_
//    }
//}
//
//
//

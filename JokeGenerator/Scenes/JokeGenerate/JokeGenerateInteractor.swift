//
//  JokeGenerateInteractor.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 14/08/2021.
//

import Foundation


protocol JokeGenerateInteractorProtocol {
    //
    func jokeRequestInitiated(request: Any)
    func shareJoke()
    func refresh()
    
}

class JokeGenerateInteractor : JokeGenerateInteractorProtocol {
    
    var presenter : JokeGeneratePresenterProtocol?
    var worker : JokeGenerateWorker?
    
    
    
    func jokeRequestInitiated(request: Any) {
// interactor call worker for getting joke and after get response, send to presenter
// func can take parameters which is necessery
        //TODO
        
        
    }
    
    func shareJoke() {
        //TODO
       
    }
    
    func refresh() {
        //TODO
        let obj = JokeGenerateWorker().fetch()
        self.presenter?.presentJoke(response: JokeModel.Response(jokeObj: obj ) )
        
        print("wubba lubba")
        print(obj)
        print("dub dub")
    }
    


}

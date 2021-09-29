//
//  JokeGenerateInteractor.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 14/08/2021.
//

import Foundation
import UIKit


protocol JokeGenerateInteractorProtocol {
    //
    func jokeRequestInitiated(request: Any)
    func refresh()
    func shareJoke(choosenJoke : GeneralJoke)
    func randomSelectImage()
    
    
}

class JokeGenerateInteractor : JokeGenerateInteractorProtocol {
    
    var presenter : JokeGeneratePresenterProtocol?
    var worker : JokeGenerateWorker?
    
    
    
    func jokeRequestInitiated(request: Any) {
// interactor call worker for getting joke and after get response, send to presenter
// func can take parameters which is necessery
        //TODO
        
        
    }
    func randomSelectImage() {
        //TODO
        
        let image = ["tongueMonkey","smileEmoji","shrek","monkey","handClown","garfieldAndDog","funnyDog","duck","donkey","cow","cockerel","clown","capHorse","banana","baby","absurtDog"]
        presenter?.presentRandomImage(imageName: image.randomElement()!)
        
        
        
        
    }
    
    func shareJoke(choosenJoke : GeneralJoke) {
        //TODO
        let activityCont = UIActivityViewController(activityItems: [choosenJoke.joke], applicationActivities: nil)
        presenter?.presentShare(share: activityCont, jokeObj: choosenJoke)
       
        
       
    }
    
    func refresh() {
        //TODO
        let obj = JokeGenerateWorker().fetch()
        self.presenter?.presentJoke(response: JokeModel.Response(jokeObj: obj ) )
    }
    


}

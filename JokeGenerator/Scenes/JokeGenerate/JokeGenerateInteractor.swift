//
//  JokeGenerateInteractor.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 14/08/2021.
//

import Foundation
import UIKit


protocol JokeGenerateInteractorProtocol {
   
    func refresh()
    func shareJoke(choosenJoke : GeneralJoke)
    func randomSelectImage()
    func checkTheme()
    
}

class JokeGenerateInteractor : JokeGenerateInteractorProtocol {
    
    
    
    var presenter : JokeGeneratePresenterProtocol?
    var worker : JokeGenerateWorkerProtocol?
    
    
    func randomSelectImage() {
        
        let image = ["tongueMonkey","smileEmoji","shrek","monkey","handClown","garfieldAndDog","duck","donkey","cow","clown","capHorse","banana","baby","absurtDog"]
        presenter?.presentRandomImage(imageName: image.randomElement()!)
        
    }
    
    func shareJoke(choosenJoke : GeneralJoke) {
        let activityCont = UIActivityViewController(activityItems: [choosenJoke.joke], applicationActivities: nil)
        presenter?.presentShare(share: activityCont, jokeObj: choosenJoke)
    
    }
    
    func refresh() {
        let obj = worker?.fetch()
        self.presenter?.presentJoke(response: JokeModel.Response(jokeObj: obj ) )
    }
    
    
    func checkTheme() {
        if SettingsViewController().keepTheme.value(forKey: UserDefaultKey.theme.rawValue) != nil {
            if SettingsViewController().keepTheme.value(forKey: UserDefaultKey.theme.rawValue) as! String == Themes.LightMode.rawValue {
                presenter?.presentTheme(color: .white)
            }
            else{
                presenter?.presentTheme(color: .black)
            }
        }
        else{
            presenter?.presentTheme(color: .white)
        }
        
    }
    


}

//
//  JokeGeneratePresenter.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 14/08/2021.
//

import Foundation
import UIKit
import SideMenu

protocol JokeGeneratePresenterProtocol {
    func presentJoke(response: JokeModel.Response)
    func presentShare(share : UIActivityViewController, jokeObj: Joke)
    func presentRandomImage(imageName: String)    
}

class JokeGeneratePresenter: JokeGeneratePresenterProtocol {
    
    weak var viewController : JokeGenerateProtocol?
    
    
    func presentJoke(response: JokeModel.Response) {
        //
        let viewModel = JokeModel.ViewModel(joke: response.jokeObj)
        
        viewController?.successJoke(viewModel: viewModel)
        
    }
    func presentShare(share : UIActivityViewController, jokeObj: Joke) {
        
        viewController?.shareJoke(chosenJoke: share)
        
    }
    func presentRandomImage(imageName: String) {
        viewController?.showRandomImage(imageName: imageName)
    }
    
    
}

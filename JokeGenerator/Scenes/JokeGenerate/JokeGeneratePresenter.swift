//
//  JokeGeneratePresenter.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 14/08/2021.
//

import Foundation
import UIKit

protocol JokeGeneratePresenterProtocol {
    func presentJoke(response: JokeModel.Response)
    func presentShare(share : UIActivityViewController, jokeObj: Joke)
    
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
}

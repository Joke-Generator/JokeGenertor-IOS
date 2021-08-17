//
//  JokeGeneratePresenter.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 14/08/2021.
//

import Foundation

protocol JokeGeneratePresenterProtocol {
    func presentJoke(response: JokeModel.Response)
    
    //
}

class JokeGeneratePresenter: JokeGeneratePresenterProtocol {
    
    weak var viewController : JokeGenerateProtocol?
    
    
    func presentJoke(response: JokeModel.Response) {
        //
        let viewModel = JokeModel.ViewModel(joke: response.jokeObj)
        
        viewController?.successJoke(viewModel: viewModel)
        
    }
}

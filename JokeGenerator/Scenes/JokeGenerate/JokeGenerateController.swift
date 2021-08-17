//
//  ViewController.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 14/08/2021.
//

import UIKit

protocol JokeGenerateProtocol : NSObjectProtocol {
    
    func successJoke(viewModel:JokeModel.ViewModel)
    func errorJoke(viewModel: Any)
    
    
}

class JokeGenerateController: UIViewController, JokeGenerateProtocol {
    
    var interactor : JokeGenerateInteractorProtocol?
    var router : (NSObjectProtocol&JokeGenerateRouterProtocol)?
    
        
    @IBOutlet weak var jokeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
//        JokeGenerateWorker().fetch()
        // Do any additional setup after loading the view.
    }
    
    func setup(){
        let viewController = self
        let interactor = JokeGenerateInteractor()
        let presenter = JokeGeneratePresenter()
        let router = JokeGenerateRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        interactor.refresh()
     
    }
    
    func successJoke(viewModel: JokeModel.ViewModel) {
        //TODO
        jokeLabel.text = viewModel.joke?.joke
        print("yeay \(String(describing: viewModel.joke)) ooo")
        
    }
    
    func errorJoke(viewModel: Any) {
        //TODO
    }

    @IBAction func refreshButtonClicked(_ sender: Any) {
        //TODO
        interactor?.refresh()
    }
    
    
    @IBAction func shareButtonClicked(_ sender: Any) {
        //TODO
        interactor?.shareJoke()
    }
    
}


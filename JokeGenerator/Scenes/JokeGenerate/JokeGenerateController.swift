//
//  ViewController.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 14/08/2021.
//

import UIKit
import SideMenu

protocol JokeGenerateProtocol : NSObjectProtocol {
    
    func successJoke(viewModel:JokeModel.ViewModel)
    func errorJoke(viewModel: Any)
    func shareJoke(chosenJoke : UIActivityViewController)
    func toSettings(menu: SideMenuNavigationController)
    func showRandomImage(imageName : String)
    

}

class JokeGenerateController: UIViewController, JokeGenerateProtocol {
    
    var interactor : JokeGenerateInteractorProtocol?
    var router : (NSObjectProtocol&JokeGenerateRouterProtocol)?
    var tempJoke : Joke?
    
        
    @IBOutlet weak var jokeLabel: UILabel!
    
    @IBOutlet weak var jokeImageViewController: UIImageView!
    
    
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
        
        //viewController.interactor = interactor
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        interactor.refresh()
        interactor.randomSelectImage()
     
    }
    
    func successJoke(viewModel: JokeModel.ViewModel) {
        //TODO
        tempJoke = viewModel.joke!
        //print(tempJoke?.joke)
        if let fun = tempJoke?.joke
        {
            jokeLabel.text = fun
        }
        
        
        print("yeay \(String(describing: viewModel.joke)) ooo")
        
    }
    
    func errorJoke(viewModel: Any) {
        //TODO
    }
    func toSettings(menu: SideMenuNavigationController) {
        present(menu, animated: true, completion: nil)
        
    }
    func shareJoke(chosenJoke : UIActivityViewController) {
        //
        present(chosenJoke, animated: true, completion: nil)
      
    }
    func showRandomImage(imageName: String) {
        //present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        jokeImageViewController.image = UIImage(named: imageName)
        print(imageName)
        print("$$$$")

    }

    @IBAction func refreshButtonClicked(_ sender: Any) {
        //TODO
        interactor?.refresh()
        interactor?.randomSelectImage()
    }
    
    
    @IBAction func shareButtonClicked(_ sender: Any) {
        //TODO
        interactor?.shareJoke(choosenJoke: tempJoke! )
    }
    
    @IBAction func toGoSettingsClicked(_ sender: Any) {
        //present(JokeGenerateRouter.toSettings(<#T##self: JokeGenerateRouter##JokeGenerateRouter#>), animated: true, completion: nil)
        router?.toSettings()
    }
    
    
}



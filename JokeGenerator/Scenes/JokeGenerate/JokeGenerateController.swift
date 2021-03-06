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
    func chanceThemeClicked(color: UIColor)
            
}

class JokeGenerateController: UIViewController, JokeGenerateProtocol, SettingsControlDelegate {
    
    
    var interactor : JokeGenerateInteractorProtocol?
    var router : (NSObjectProtocol&JokeGenerateRouterProtocol)?
    var worker : JokeGenerateWorkerProtocol?
    var tempJoke : GeneralJoke?
    var menu : SideMenuNavigationController?
    
    
    @IBOutlet weak var jokeLabel: UILabel!
    
    @IBOutlet weak var jokeImageViewController: UIImageView!
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    
    
    @IBOutlet weak var refreshButton: UIButton!
    
    @IBOutlet weak var shareButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        let settingsView = SettingsViewController()
        settingsView.delegate = self
        menu = SideMenuNavigationController(rootViewController: settingsView)
        refreshButton.layer.cornerRadius = refreshButton.frame.height/3
        shareButton.layer.cornerRadius = shareButton.frame.height/3

    }
    

    func setup(){
        let viewController = self
        let interactor = JokeGenerateInteractor()
        let presenter = JokeGeneratePresenter()
        let router = JokeGenerateRouter()
        let worker = JokeGenerateWorker()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.viewController = viewController
        router.viewController = viewController
        interactor.refresh()
        interactor.randomSelectImage()
        interactor.checkTheme()
        
        
    }
    
    func successJoke(viewModel: JokeModel.ViewModel) {
        //TODO
        tempJoke = viewModel.joke
        if let fun = tempJoke?.joke
        {
            jokeLabel.text = fun
        }
    }
    
    func errorJoke(viewModel: Any) {
        //TODO
    }
    
    func toSettings(menu: SideMenuNavigationController) {
        present(menu, animated: true, completion: nil)
        
    }
    
    func chanceThemeClicked(color: UIColor) {
        if color == UIColor.black {
            view.backgroundColor = color
            jokeLabel.textColor = .white
            settingsButton.tintColor = .white
        }
        else{
            view.backgroundColor = color
            jokeLabel.textColor = .black
            settingsButton.tintColor = .black
        }
    }
    
    func shareJoke(chosenJoke : UIActivityViewController) {
        present(chosenJoke, animated: true, completion: nil)
    }
    
    func showRandomImage(imageName: String) {
        jokeImageViewController.image = UIImage(named: imageName)
        
    }
    func rateUs(){
        if  let url = URL(string: "itms-apps://itunes.apple.com/app/" + "appId") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)//shared openda hata var
        }
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
        router?.toSettings(menu: menu!)
    }
    
    
}



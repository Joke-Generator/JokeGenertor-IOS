//
//  JokeGenerateRouter.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 14/08/2021.
//

import Foundation

protocol JokeGenerateRouterProtocol{
    func changeView()
}

class  JokeGenerateRouter : NSObject, JokeGenerateRouterProtocol {
   
    
    //
    var viewController: JokeGenerateController?
    func changeView() {
        //yeay
    }
}

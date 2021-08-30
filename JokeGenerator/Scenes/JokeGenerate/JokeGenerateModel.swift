//
//  JokeGenerateModel.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 16/08/2021.
//

import Foundation

struct JokeModel {
    struct Response {
        var jokeObj : GeneralJoke?
    }
    struct ViewModel {
        var joke : GeneralJoke?
    }
}

enum JokeType : String {
    case single = "single"
    case twoPart = "twopart"
}


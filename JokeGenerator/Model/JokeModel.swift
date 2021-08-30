//
//  JokeModel.swift
//  JokeGenerator
//
//  Created by Furkan Kaan Ugsuz on 17/08/2021.
//

import Foundation

struct JokeSingle: Codable {
    let error: Bool
    let category, type, joke: String
    let flags: Flags
    let id: Int
    let safe: Bool
    let lang: String
}

struct JokeTwoPart: Codable {
    let error: Bool
    let category, type, setup, delivery: String
    let flags: Flags
    let id: Int
    let safe: Bool
    let lang: String
}

struct GeneralJoke : Codable {
    let joke : String
    let category : String
}

// MARK: - Flags
struct Flags: Codable {
    let nsfw, religious, political, racist: Bool
    let sexist, explicit: Bool
}


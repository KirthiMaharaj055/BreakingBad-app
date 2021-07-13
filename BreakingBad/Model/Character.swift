//
//  Character.swift
//  BreakingBad
//
//  Created by IACD-Air-7 on 2021/06/28.
//

import Foundation
//import UIKit
/*
struct Welcome: Decodable {
    var response: Character
}
struct Character: Decodable {
    var character:[CharacterDetail]
}
*/
struct CharacterDetail: Decodable{
    let charID: Int
    let name: String
    let birthday: Birthday
    let occupation: [String]
    let img: String
    let status: Status
    let nickname: String
    let portrayed: String

    enum CodingKeys: String, CodingKey {
        case charID = "char_id"
        case name, birthday, occupation, img, status, nickname, portrayed
    }
}
enum Birthday: String, Decodable {
    case the07081993 = "07-08-1993"
    case the08111970 = "08-11-1970"
    case the09071958 = "09-07-1958"
    case the09241984 = "09-24-1984"
    case unknown = "Unknown"
}
enum Status: String, Decodable {
    case alive = "Alive"
    case deceased = "Deceased"
    case presumedDead = "Presumed dead"
    case unknown = "Unknown"
    
   
}


//typealias breakBad = [Character]






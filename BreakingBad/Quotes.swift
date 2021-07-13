//
//  Quote.swift
//  BreakingBad
//
//  Created by IACD-Air-7 on 2021/07/06.
//

import Foundation


struct QuoteDetail: Decodable {
    let quoteID: Int
    let quote, author: String
    let series: Series

    enum CodingKeys: String, CodingKey {
        case quoteID = "quote_id"
        case quote, author, series
    }
}

enum Series: String, Decodable {
    case betterCallSaul = "Better Call Saul"
    case breakingBad = "Breaking Bad"
}

//typealias Quote = [Quotes]

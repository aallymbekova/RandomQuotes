//
//  QouteData.swift
//  RandomQuotes WatchKit Extension
//
//  Created by darmaraht on 10/1/24.
//

import Foundation

// MARK: - QuoteData
struct QuoteData: Decodable {
    let qotdDate: String
    let quote: Quote

    enum CodingKeys: String, CodingKey {
        case qotdDate = "qotd_date"
        case quote
    }
}

// MARK: - Quote
struct Quote: Decodable {
    let id: Int
    let dialogue, quotePrivate: Bool
    let tags: [String]
    let url: String
    let favoritesCount, upvotesCount, downvotesCount: Int
    let author, authorPermalink, body: String

    enum CodingKeys: String, CodingKey {
        case id, dialogue
        case quotePrivate = "private"
        case tags, url
        case favoritesCount = "favorites_count"
        case upvotesCount = "upvotes_count"
        case downvotesCount = "downvotes_count"
        case author
        case authorPermalink = "author_permalink"
        case body
    }
}

//
//  Qoute.swift
//  RandomQuotes WatchKit Extension
//
//  Created by darmaraht on 11/1/24.
//

import Foundation

struct Qoute {
    let qoute: String
    
    init?(qouteData: QuoteData) {
        qoute = qouteData.quote.body
    }
}

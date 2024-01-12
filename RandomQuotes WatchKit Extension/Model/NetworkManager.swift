//
//  NetworkManager.swift
//  RandomQuotes WatchKit Extension
//
//  Created by darmaraht on 10/1/24.
//

import Foundation

struct NetworkManager {
    
    var onCompletion: ((Qoute) -> Void)?
        
    func fetchQoute() {
        
        let urlString = "https://favqs.com/api/qotd"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
      let task =  session.dataTask(with: url) { data, response, error in
          if let data = data {
              if let quote = self.parseJSON(withData: data) {
                  self.onCompletion?(quote)
              }
          }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> Qoute? {
        let decoder = JSONDecoder()
        do {
       let quoteData = try decoder.decode(QuoteData.self, from: data)
            guard let quote = Qoute(qouteData: quoteData) else {
                return nil
            }
            return quote
        } catch let error as NSError {
            print(error)
        }
        return nil
    }
}

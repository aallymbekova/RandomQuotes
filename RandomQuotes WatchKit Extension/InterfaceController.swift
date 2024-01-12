//
//  InterfaceController.swift
//  RandomQuotes WatchKit Extension
//
//  Created by darmaraht on 10/1/24.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var quotesLabel: WKInterfaceLabel!
    @IBOutlet weak var quetesButtonTapped: WKInterfaceButton!
    
    var networkManager = NetworkManager()
    private var timer: Timer?
    
    override func awake(withContext context: Any?) {
        
        self.quotesLabel.setText("")
        
    
    }
    
    @IBAction func randomQuotesTapped() {
        
        networkManager.onCompletion = { qoute in
            self.quotesLabel.setText(qoute.qoute)
            
        }
        networkManager.fetchQoute()
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: false , block: { _ in
            self.quotesLabel.setText("")
            
        })
    
    }
}

//
//  ViewController.swift
//  RandomQuote
//
//  Created by Wejdan on 05/11/1441 AH.
//

import UIKit

class QuoteViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var quoteBodyLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    
    var quote : Quote?
    let quoteManger = QuoteManger()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuote()

        
    }
    
    func updateUI() {
        authorLabel.text = ""
        quoteBodyLabel.text = ""
        
        activityIndicator.startAnimating()
        
    }
    
    // MARK: - Connection
    func loadQuote () {
        
        updateUI()
    
      
        quoteManger.fetchQuote() { loadedQuote,error  in
            DispatchQueue.main.async {

                if (error == nil) {
                self.quote = loadedQuote
                }else{
                    if let lastQoute = self.quoteManger.getLastQoute() {
                        self.quote = lastQoute
                    }
                }
                
                //set quoteBody and author
                self.quoteBodyLabel.text = self.quote?.body
                self.authorLabel.text = self.quote?.author
            
                self.activityIndicator.stopAnimating()
                    
    }
    
        }


}
    
    // MARK: - IBAction
    
    @IBAction func showNextQuotePressed(_ sender: UIButton) {
        loadQuote()
    }
    
    @IBAction func addToFevoratePressed(_ sender: UIButton) {

        if let saveQuote = quote {
            quoteManger.addFevorateQuote(saveQuote)

        }
    }
    

}


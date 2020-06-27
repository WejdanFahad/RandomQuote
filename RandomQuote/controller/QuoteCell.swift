//
//  QuoteCell.swift
//  RandomQuote
//
//  Created by Wejdan on 06/11/1441 AH.
//

import UIKit

class QuoteCell: UITableViewCell {


    @IBOutlet weak var quoteBodyLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
     var quote: Quote! {
         didSet {
             updateUI()
         }
     }
     
     func updateUI() {
        quoteBodyLabel.text = quote.body
        authorLabel.text =  quote.author
     }

}

//
//  QuoteTableViewController.swift
//  RandomQuote
//
//  Created by Wejdan on 06/11/1441 AH.
//

import UIKit

class QuoteTableViewController: UITableViewController {

    var qoutes : [Quote] {
        let quoteManger = QuoteManger()
        return quoteManger.getFevorateQuotes()
            
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qoutes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! QuoteCell

        let qoute = qoutes[indexPath.row]
        cell.quote = qoute

        return cell
    }
    

}

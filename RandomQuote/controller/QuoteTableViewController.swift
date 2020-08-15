//
//  QuoteTableViewController.swift
//  RandomQuote
//
//  Created by Wejdan on 06/11/1441 AH.
//

import UIKit
import CoreData

class QuoteTableViewController: UITableViewController  {
    
    
    var fetchedResultsController: NSFetchedResultsController<FevorateQuote>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSavedQuotes()
    }
    
    
    func fetchSavedQuotes() {
        let fetchRequest: NSFetchRequest<FevorateQuote> = FevorateQuote.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchedResultsController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: DataController.shared.viewContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        fetchedResultsController.delegate = self
        do {
            try fetchedResultsController.performFetch()
            
        } catch {
            self.showAlert(K.errorMessage)
            
        }
    }
    
    
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.sections?[section].numberOfObjects ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! QuoteCell
        
        let qoute = fetchedResultsController.object(at: indexPath)
        
        cell.quote = qoute
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            let qoute = fetchedResultsController.object(at: indexPath)
            DataController.shared.viewContext.delete(qoute)
            try? DataController.shared.viewContext.save()
        default:
            break
        }
    }
    
}


// MARK: - Fetched Results Controller Delegate

extension QuoteTableViewController: NSFetchedResultsControllerDelegate {
    
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        tableView.reloadData()
        
    }
    
    
}

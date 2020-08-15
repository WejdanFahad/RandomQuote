//
//  DataController.swift
//  RandomQuote
//
//  Created by Wejdan on 25/12/1441 AH.
//

import Foundation
import CoreData

class DataController {
    
      static let shared = DataController()
      
      let persistentContainer:NSPersistentContainer
      
      var viewContext:NSManagedObjectContext {
          return persistentContainer.viewContext
      }
      
      
      private init() {
          persistentContainer = NSPersistentContainer(name: "RandomQuote")
        }
      

      
      func load(completion: (() -> Void)? = nil) {
          persistentContainer.loadPersistentStores { storeDescription, error in
              guard error == nil else {
                  fatalError(error!.localizedDescription)
              }
              self.autoSaveViewContext()
              completion?()
          }
      }
    
}

extension DataController {
    func autoSaveViewContext(intervel:TimeInterval = 30) {
        guard intervel > 0 else {
            print("cannot set negative")
            return
        }
        
        if viewContext.hasChanges{
            try? viewContext.save()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + intervel){
            self.autoSaveViewContext(intervel: intervel)
            
        }
    }
}

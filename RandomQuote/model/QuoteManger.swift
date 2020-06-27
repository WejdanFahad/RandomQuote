//
//  QuoteAPI.swift
//  RandomQuote
//
//  Created by Wejdan on 05/11/1441 AH.
//

import UIKit

class QuoteManger {
    
    public func fetchQuote (completionHandler: @escaping (_ quote: Quote? ,_ error: Error?) -> (Void)){
               
           let url = URL(string: K.quoteURL)!

           URLSession.shared.dataTask(with: url) { data, response, error in
               if let error = error {
                   print("Error: \(error.localizedDescription)")
                completionHandler(nil , error )
               }
               guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                   print("Error: invalid HTTP response code")
                   return
               }
               guard let data = data else {
                   print("Error: missing data")
                   return
               }

               
               do {
                  
                   let decoder = JSONDecoder()
                   let quote : Quote = try decoder.decode(Quote.self, from: data)
      
                self.saveQuote(quote)
                completionHandler(quote , error )
                   
               }
               catch {
                   print("Error: \(error.localizedDescription)")
               }
           }.resume()
           
          
           
           return
           
       }
    
    
    func getLastQoute () -> Quote? {
        if let data = UserDefaults.standard.value(forKey:K.lastQuoteKey) as? Data {
        let decodedQoutes = try? PropertyListDecoder().decode(Quote.self, from: data)
        return decodedQoutes
           }
        return nil
    }
    
    func saveQuote(_ quote : Quote) {

        UserDefaults.standard.set(try? PropertyListEncoder().encode(quote), forKey:K.lastQuoteKey)
        UserDefaults.standard.synchronize()
    }
    
    func getFevorateQuotes() -> [Quote] {
        if let data = UserDefaults.standard.value(forKey:K.fevorateKey) as? Data {
        let decodedQoutes = try? PropertyListDecoder().decode([Quote].self, from: data)
        return decodedQoutes!
           }
        return []
    }
    
    func addFevorateQuote(_ quote : Quote) {
        
        var fevorateQuote = getFevorateQuotes()
            fevorateQuote.append(quote)
        
        UserDefaults.standard.set(try? PropertyListEncoder().encode(fevorateQuote), forKey:K.fevorateKey)
               UserDefaults.standard.synchronize()
    }
    

}


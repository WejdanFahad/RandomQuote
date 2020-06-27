//
//  Quote.swift
//  RandomQuote
//
//  Created by Wejdan on 05/11/1441 AH.
//

import UIKit

struct Quote: Codable {
          
    let id: String
    let author: String
    let body : String

                 
    enum CodingKeys: String, CodingKey {
         case id
         case author
         case body = "en"
    }

}

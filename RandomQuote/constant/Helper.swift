//
//  Helper.swift
//  RandomQuote
//
//  Created by Wejdan on 25/12/1441 AH.
//

import UIKit

extension UIViewController {
  

   func showAlert(_ message : String ) {
       let alertVC = UIAlertController(title: "", message: message, preferredStyle: .alert)
             alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
       present(alertVC, animated: true, completion: nil)
  }

}

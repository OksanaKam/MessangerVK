//
//  UIViewController + Extension.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 21.02.2022.
//

import UIKit

extension UIViewController {
    func show(message: String) {
        
        let alertVC = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
        
    }
}

//
//  Extensions.swift
//  InstagramCloneProject
//
//  Created by Ömer Faruk Kılıçaslan on 30.06.2022.
//

import UIKit



extension UIViewController {
    
    func makeAlert(title:String, message:String){
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}

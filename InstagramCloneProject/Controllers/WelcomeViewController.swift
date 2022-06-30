//
//  ViewController.swift
//  InstagramCloneProject
//
//  Created by Ömer Faruk Kılıçaslan on 30.06.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var emailTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toFeedVC", sender: nil)
        
    }
    @IBAction func signUpButtonClicked(_ sender: Any) {
        
        
    }
    
}


//
//  SettingsViewController.swift
//  InstagramCloneProject
//
//  Created by Ömer Faruk Kılıçaslan on 30.06.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logOutButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toWelcomeVC", sender: nil)
    }
    
    
}

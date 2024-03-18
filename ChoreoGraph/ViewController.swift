//
//  ViewController.swift
//  ChoreoGraph
//
//  Created by Forrest Sun on 3/8/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LoginSegue" {
            if let destinationVC = segue.destination as? LoginScreen {
                // change to Login VC after x time
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


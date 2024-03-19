//
//  ViewController.swift
//  ChoreoGraph
//
//  Created by Forrest Sun on 3/8/24.
//

import UIKit

class LoginScreen: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func LoginButtonPressed(_ sender: Any) {
        guard let username = usernameTextField.text, !username.isEmpty,
                  let password = passwordTextField.text, !password.isEmpty else {
                // alert - add functionality later
                return
            }
        
        performSegue(withIdentifier: "LoginSegue", sender: self)
    }
    
    @IBAction func SignUpButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "SignUpSegue", sender: self)
    }
    
    // 'return' key
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // dismiss keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


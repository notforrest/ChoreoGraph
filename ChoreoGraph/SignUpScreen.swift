//
//  SignUpScreen.swift
//  ChoreoGraph
//
//  Created by Kathy Cui on 3/18/24.
//

import UIKit

class SignUpScreen: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var passwordMismatch: UILabel!
    
    @IBAction func SignUpButtonPressed(_ sender: Any) {
        if password.text == confirmPassword.text {
                performSegue(withIdentifier: "SignUpSegue", sender: self)
            } else {
                passwordMismatch.isHidden = false
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

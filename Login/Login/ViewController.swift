//
//  ViewController.swift
//  Login
//
//  Created by John Padilla on 9/29/20.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    
    @IBOutlet weak var forgotUsernameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func forgotUsernameOrPassword(_ sender: Any) {
        performSegue(withIdentifier: "LandingPage", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let sender = sender as? UIButton else { return }
        
        if sender == forgotUsernameButton {
            segue.destination.navigationItem.title = "Forgot Username"
        } else if sender == forgotPasswordButton {
            segue.destination.navigationItem.title = "Forgot Password"
        } else {
            segue.destination.navigationItem.title = usernameTextField.text
        }
    }
}


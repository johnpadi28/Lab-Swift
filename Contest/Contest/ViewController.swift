//
//  ViewController.swift
//  Contest
//
//  Created by John Padilla on 11/4/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var emailLabel: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitButtonPressed(_ sender: UIButton) {
        if let text = emailLabel.text, !text .isEmpty {
            performSegue(withIdentifier: "pushToWin", sender: nil)
        } else {
            shakeTextfield()
        }
    }
    
    func shakeTextfield() {
        UIView.animate(withDuration: 0.1, animations: {
            let translationRight = CGAffineTransform(translationX: 10, y: 0)
            self.emailLabel.transform = translationRight
        }) { (_) in
            UIView.animate(withDuration: 0.1, animations: {
                let translationLeft = CGAffineTransform(translationX: -20, y: 0)
                self.emailLabel.transform = translationLeft
            }, completion: { (_) in
                self.emailLabel.transform = CGAffineTransform.identity
            })
        }
    }
    
}


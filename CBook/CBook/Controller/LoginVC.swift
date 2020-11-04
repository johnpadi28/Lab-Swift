//
//  LoginVC.swift
//  CBook
//
//  Created by John Padilla on 10/9/20.
//

import UIKit

class LoginVC: UIViewController {
    
    let logoContainerView: UIView = {
        let view = UIView()
        
        let logoImageView = UIImageView(image: #imageLiteral(resourceName: "logoHome"))
        logoImageView.contentMode = .scaleAspectFill
        view.addSubview(logoImageView)
        logoImageView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddinTop: 0, paddingLeft: 0, paddnigbottom: 0, paddingRight: 0, width: 80, height: 80)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
    }()
    
    lazy var emailContinerView: UIView = {
        let view = UIView()
        return textContainerView(view: view, #imageLiteral(resourceName: "ic_mail_outline_white_2x"), emailTextField)
    }()
    
    lazy var passwordContainerView: UIView = {
        let view = UIView()
        return textContainerView(view: view, #imageLiteral(resourceName: "ic_lock_outline_white_2x"), passwordTextfield)
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceolder: "Email", isSecureTextEntry: false)
    }()
    
    lazy var passwordTextfield: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceolder: "Password", isSecureTextEntry: false)
    }()
    
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor(red: 252, green: 161, blue: 161), for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        return button
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot Password", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    let dontHaveAnAccountButton: UIButton = {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: "Don't have an Account? " , attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.white]))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 240, green: 95, blue: 95)
        configureViewComponents()

    }
    

    func configureViewComponents() {
        view.addSubview(logoContainerView)
        logoContainerView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddinTop: 50, paddingLeft: 40, paddnigbottom: 0, paddingRight: 40, width: 0, height: 100)
        logoContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(emailContinerView)
        emailContinerView.anchor(top: logoContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddinTop: 24, paddingLeft: 32, paddnigbottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(passwordContainerView)
        passwordContainerView.anchor(top: emailContinerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddinTop: 16, paddingLeft: 32, paddnigbottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(forgotPasswordButton)
        forgotPasswordButton.anchor(top: passwordContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddinTop: 16, paddingLeft: 32, paddnigbottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(loginButton)
        loginButton.anchor(top: forgotPasswordButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddinTop: 24, paddingLeft: 32, paddnigbottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(dontHaveAnAccountButton)
        dontHaveAnAccountButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddinTop: 0, paddingLeft: 32, paddnigbottom: 15, paddingRight: 32, width: 0, height: 50)

    }
}

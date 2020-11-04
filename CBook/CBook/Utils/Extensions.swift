//
//  Extensions.swift
//  CBook
//
//  Created by John Padilla on 10/9/20.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddinTop: CGFloat, paddingLeft: CGFloat, paddnigbottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddinTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddnigbottom).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

//MARK: -Color
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let redValue = CGFloat(red) / 255.0
        let greenValue = CGFloat(green) / 255.0
        let blueValue = CGFloat(blue) / 255.0
        
        self.init(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0
        )
    }
}

func textContainerView(view: UIView, _ image: UIImage, _ textField: UITextField) -> UIView {
    view.backgroundColor = .clear
    
    let imageView = UIImageView()
    imageView.image = image
    imageView.alpha = 0.87
    view.addSubview(imageView)
    imageView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: nil, paddinTop: 0, paddingLeft: 8, paddnigbottom: 0, paddingRight: 0, width: 24, height: 24)
    imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    
    view.addSubview(textField)
    textField.anchor(top: nil, left: imageView.rightAnchor, bottom: nil, right: view.rightAnchor, paddinTop: 0, paddingLeft: 12, paddnigbottom: 0, paddingRight: 8, width: 0, height: 0)
    textField.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
    
    let separatorView = UIView()
    separatorView.backgroundColor = UIColor(white: 1, alpha: 0.87)
    view.addSubview(separatorView)
    separatorView.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddinTop: 0, paddingLeft: 8, paddnigbottom: 0, paddingRight: 0, width: 0, height: 0.75)
    
    return view
}

extension UITextField {
    func textField(withPlaceolder placeholder: String, isSecureTextEntry: Bool) -> UITextField {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.textColor = .white
        tf.isSecureTextEntry = isSecureTextEntry
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return tf
    }
}



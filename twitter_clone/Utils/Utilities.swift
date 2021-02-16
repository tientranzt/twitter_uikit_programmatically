//
//  Utilities.swift
//  twitter_clone
//
//  Created by tientran on 03/02/2021.
//

import UIKit

class Utilities {
    
    func templateInputContainer(_ imageName : String, _ textField : UITextField) -> UIView {
        
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 30).isActive = true
        let iv =  UIImageView(image: UIImage(systemName: imageName)!)
        iv.tintColor = .white
        view.addSubview(iv)
        view.addSubview(textField)
        iv.anchor(left: view.leftAnchor, width: 25, height: 25)
        textField.anchor(left: iv.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 12, paddingBottom: 10, paddingRight: 12)
        textField.centerY(inView: iv)
        
        let dividerView = UIView()
        dividerView.backgroundColor = .white
        view.addSubview(dividerView)
        
        dividerView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor,height: 0.75)
    
        return view
    }
    
    func templateTextField(withPlaceholder placeholder: String) -> UITextField {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.textColor = .white
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return tf
    }
    
    func attributedButton(_ firstPart : String, _ secondPart : String) -> UIButton {
        let button = UIButton(type: .system)
        
        let attributeButton = NSMutableAttributedString(string: firstPart, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.white ])
        attributeButton.append(NSMutableAttributedString(string: secondPart, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.white ]))
        
        button.setAttributedTitle(attributeButton, for: .normal)
        
        return button
    }
}

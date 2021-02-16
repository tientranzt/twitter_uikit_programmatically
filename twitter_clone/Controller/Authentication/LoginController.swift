//
//  LoginController.swift
//  twitter_clone
//
//  Created by tientran on 03/02/2021.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK - properties
    private let logoImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "globe")
        iv.tintColor = .white
        return iv
    }()
    
    private let userTextField : UITextField = {
        let tf =  Utilities().templateTextField(withPlaceholder: "Email")
        return tf
    }()
    
    private let passwordTextField : UITextField = {
        let tf = Utilities().templateTextField(withPlaceholder: "Password")
        tf.isSecureTextEntry =  true
        return tf
    }()
    
    private lazy var textFieldContainer : UIView = {
        
        let view =  Utilities().templateInputContainer("person", userTextField)
        
        return view
    }()
    
    private lazy var passwordFieldContainer : UIView = {
        
        let view =  Utilities().templateInputContainer("lock", passwordTextField)
        
        return view
    }()
    
    private let loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.twitterBlue, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    private let noHaveAccountButton : UIButton = {
        let button = Utilities().attributedButton("Don't have account?", " Sign Up")
        button.addTarget(self, action: #selector(handleDontHaveAccountButton), for: .touchUpInside)
        return button
    }()
    
    @objc func handleLoginButton(){
        
    }
    
    @objc func handleDontHaveAccountButton(){
        let registerController = RegisterController()

        navigationController?.pushViewController(registerController, animated: true)
    }
    

    // MARK - lifecircle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    // MARK - helpers
    
    func configureUI()  {
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(logoImage)
        logoImage.anchor(top:view.safeAreaLayoutGuide.topAnchor, width: 80, height: 80)
        logoImage.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [textFieldContainer, passwordFieldContainer, loginButton])
        stack.axis = .vertical
        stack.spacing = 30
        
        view.addSubview(stack)
        stack.anchor(top: logoImage.bottomAnchor, left: view.leftAnchor ,right: view.rightAnchor, paddingTop: 50, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(noHaveAccountButton)
        noHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor)
        
    }
    
    
}

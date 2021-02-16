//
//  RegisterController.swift
//  twitter_clone
//
//  Created by tientran on 03/02/2021.
//

import UIKit

class RegisterController: UIViewController {
    
    let imagePicker = UIImagePickerController()
    
    // MARK - properties
    private let userImage : UIButton = {
        let button = UIButton()
        button.setImage( UIImage(systemName: "person.circle"), for: .normal)
        button.tintColor = .white
        button.layer.borderWidth = 1.0
        button.layer.masksToBounds = false
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 80 / 2
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(handleUserImageTaped), for: .touchUpInside)
        
        return button
    }()
    
    private let alreadyHaveAccountButton : UIButton = {
        let button = Utilities().attributedButton("Already have account?", " Login")
        button.addTarget(self, action: #selector(handleAlreadyHaveAccountButton), for: .touchUpInside)
        return button
    }()
    
    private let emailTextField : UITextField = {
        let tf =  Utilities().templateTextField(withPlaceholder: "Email")
        return tf
    }()
    
    private lazy var emailContainer : UIView = {
        
        let view =  Utilities().templateInputContainer("envelope", emailTextField)
        return view
        
    }()
    
    private let passwordTextField : UITextField = {
        let tf =  Utilities().templateTextField(withPlaceholder: "Password")
        return tf
    }()
    
    private lazy var passwordContainer : UIView = {
        
        let view =  Utilities().templateInputContainer("lock", passwordTextField)
        return view
        
    }()
    
    private let fullnameTextField : UITextField = {
        let tf =  Utilities().templateTextField(withPlaceholder: "Full Name")
        return tf
    }()
    
    private lazy var fullnameContainer : UIView = {
        
        let view =  Utilities().templateInputContainer("person", fullnameTextField)
        return view
        
    }()
    
    private let usernameTextField : UITextField = {
        let tf =  Utilities().templateTextField(withPlaceholder: "User Name")
        return tf
    }()
    
    private lazy var usernameContainer : UIView = {
        
        let view =  Utilities().templateInputContainer("person", usernameTextField)
        return view
        
    }()
    
    private let registerButton : UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.twitterBlue, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleRegisterButton), for: .touchUpInside)
        
        return button
    }()
    
    
    
    // MARK - lifecircle
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        configureUI()
    }
    
    
    // MARK - helpers
    func configureUI() {
        view.backgroundColor = .twitterBlue
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor)
        
        view.addSubview(userImage)
        userImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, width: 80, height: 80)
        userImage.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [emailContainer, passwordContainer, fullnameContainer, usernameContainer, registerButton])
        stack.axis = .vertical
        stack.spacing = 30
        
        view.addSubview(stack)
        stack.anchor(top: userImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,paddingTop: 50 , paddingLeft: 32, paddingRight: 32)
        
    }
    
    @objc func handleAlreadyHaveAccountButton(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleRegisterButton(){
        print("register button click")
    }
    
    @objc func handleUserImageTaped(){
        present(imagePicker, animated: true, completion: nil)
    }
    
}

extension RegisterController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else {
            return
        }
        
        userImage.setImage(profileImage, for: .normal)
        dismiss(animated: true, completion: nil)
    }

}

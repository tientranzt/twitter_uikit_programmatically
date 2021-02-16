//
//  CaptionTextView.swift
//  twitter_clone
//
//  Created by tientran on 06/02/2021.
//

import UIKit

class CaptionTextView: UITextView {
    
    private let placeholderLabel : UILabel = {
        let label = UILabel()
        label.text = "What's up guy?"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        return label
    }()

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        isScrollEnabled = false
        heightAnchor.constraint(equalToConstant: 300).isActive = true
        addSubview(placeholderLabel)
        placeholderLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 4)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handelTextInputChange), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK - selectors
    
    @objc func handelTextInputChange(){
        if text.isEmpty {
            placeholderLabel.isHidden = false
        }
        else {
            placeholderLabel.isHidden = true
        }
    }
    
    
    
    

}

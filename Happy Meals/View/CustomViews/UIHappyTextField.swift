//
//  UIHappyTextField.swift
//  Happy Meals
//
//  Created by Ahmed Yamany on 12/09/2022.
//

import UIKit

class UIHappyTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 20
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 44).isActive = true
        backgroundColor = .white
        returnKeyType = .continue
        keyboardAppearance = .default
        spellCheckingType = .no
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setLeftPaddingPoints(_ amount:CGFloat){
         let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
         self.leftView = paddingView
         self.leftViewMode = .always
     }
     func setRightPaddingPoints(_ amount:CGFloat) {
         let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
         self.rightView = paddingView
         self.rightViewMode = .always
     }
    
    
    
}

//
//  LoginViewController.swift
//  Happy Meals
//
//  Created by Ahmed Yamany on 10/09/2022.
//

import UIKit

class LoginViewController: UIHappyViewController {
    
    // MARK: - Views
    override func viewDidLoad() {
        super.viewDidLoad()
        super.titleLabel.text = "Log in to your account"
        view.addSubview(super.titleLabel)
        super.configuretTitleLabelConstraints()

    }



}


//
//  LoginViewController.swift
//  Happy Meals
//
//  Created by Ahmed Yamany on 10/09/2022.
//

import UIKit

class LoginViewController: UIHappyViewController {
    // MARK: - SubViews
    lazy var emailTF: UIHappyTextField = {
       let textField = UIHappyTextField()
        textField.placeholder = "Email"
        textField.setLeftPaddingPoints(20)
        
        textField.keyboardType = .emailAddress
        

        return textField
    }()
    
    lazy var forgotButton: UIButton = {
        let forgotButton = UIButton()
        forgotButton.setTitleColor(Constants.shared.backgroudColor, for: .normal)
        forgotButton.setTitle("Forgot?", for: .normal)
        forgotButton.translatesAutoresizingMaskIntoConstraints = false
        
        return forgotButton
    }()
    
    lazy var passwordTF: UIHappyTextField = {
        let textField = UIHappyTextField()
        textField.placeholder = "Password"
        textField.setLeftPaddingPoints(20)
        textField.addSubview(forgotButton)
        
        textField.keyboardType = .default
        textField.isSecureTextEntry = true

        return textField
    }()
    
    lazy var loginButton: UIHappyButton = {
        let button = UIHappyButton()
        
        button.backgroundColor = Constants.shared.backgroudColor
        var configuration = UIButton.Configuration.plain()
        configuration.title = "Log in"
        configuration.baseForegroundColor = .systemBackground
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var textFieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(self.emailTF)
        stackView.addArrangedSubview(self.passwordTF)
        stackView.addArrangedSubview(self.loginButton)
        return stackView
    }()
    
    lazy var noAccountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "Don't have an account?"
        
        return label
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(Constants.shared.backgroudColor, for: .normal)
        return button
        
    }()
    
    
    lazy var noAccountsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(noAccountLabel)
        stackView.addArrangedSubview(signUpButton)
        return stackView
    }()
    
    
    
    
    
    
    // MARK: - Views
    override func viewDidLoad() {
        super.viewDidLoad()
        super.titleLabel.text = "Log in to your account"
        view.addSubview(super.titleLabel)
        super.configuretTitleLabelConstraints()
        
        view.addSubview(textFieldsStackView)
        
        emailTF.delegate = self
        passwordTF.delegate = self
        
        view.addSubview(noAccountsStackView)
        
        configureConstraints()

        
        

    }

    
    private func configureConstraints(){
        
        NSLayoutConstraint.activate([
            textFieldsStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            textFieldsStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            textFieldsStackView.topAnchor.constraint(equalTo: super.titleLabel.bottomAnchor, constant: 80),
            
            forgotButton.centerYAnchor.constraint(equalTo: passwordTF.centerYAnchor),
            forgotButton.trailingAnchor.constraint(equalTo: passwordTF.trailingAnchor, constant: -20),
            
            noAccountsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noAccountsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
            
        ])
    }
}


extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField{
        case emailTF:
            passwordTF.becomeFirstResponder()
        default:
            self.view.endEditing(true)
            
        }
       
        
        return true
    }
    
    func hideKeyboard() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
}

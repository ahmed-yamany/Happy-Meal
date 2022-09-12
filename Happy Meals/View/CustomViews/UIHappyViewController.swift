//
//  UIHappyViewController.swift
//  Happy Meals
//
//  Created by Ahmed Yamany on 12/09/2022.
//

import UIKit

class UIHappyViewController: UIViewController {
    lazy var titleLabel = UIHappyLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "GetStartBackGround")
        navigationItem.setLeftBarButton(LeftBarButtonItem(target: self), animated: true)
        
        titleLabel.numberOfLines = 0

    }
    
    func configuretTitleLabelConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }


}

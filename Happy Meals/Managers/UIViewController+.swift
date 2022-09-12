//
//  UIViewController+.swift
//  Happy Meals
//
//  Created by Ahmed Yamany on 12/09/2022.
//

import UIKit

extension UIViewController{
    // MARK: - lefBarItem Action
    @objc func lefBarItemAction(){
        navigationController?.popViewController(animated: true)
    } 
}

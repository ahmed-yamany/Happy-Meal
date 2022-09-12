//
//  leftSwipes.swift
//  Happy Meals
//
//  Created by Ahmed Yamany on 11/09/2022.
//

import UIKit

extension UINavigationController{
    
    func setupGestureRecognizers() {
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeAction(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizer.Direction.left
        view.addGestureRecognizer(leftSwipe)
    }
    @objc private func swipeAction(swipe: UISwipeGestureRecognizer) {
        self.popViewController(animated: true)
    }
    
    
}

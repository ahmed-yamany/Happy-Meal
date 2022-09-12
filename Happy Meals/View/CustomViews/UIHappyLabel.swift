//
//  HappyUILabel.swift
//  Happy Meals
//
//  Created by Ahmed Yamany on 12/09/2022.
//

import UIKit


class UIHappyLabel: UILabel{
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = Constants.shared.backgroudColor
        font = .systemFont(ofSize: 30, weight: .bold)
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

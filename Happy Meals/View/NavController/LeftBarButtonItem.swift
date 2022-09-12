//
//  LeftBarButtonItem.swift
//  Happy Meals
//
//  Created by Ahmed Yamany on 10/09/2022.
//

import UIKit

//protocol LeftBarButtonItemDelegate


class LeftBarButtonItem: UIBarButtonItem {
    
    init(target: AnyObject?) {
        super.init()
        super.target = target
        
        super.image =  UIImage(systemName: "chevron.backward")
        super.style = .done
        super.tintColor = .label
        
        if let target = target as? UIViewController {
            super.action = #selector(target.lefBarItemAction)
        }
            
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

    
}



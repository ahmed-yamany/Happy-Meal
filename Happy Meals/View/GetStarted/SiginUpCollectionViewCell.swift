//
//  SiginUpCollectionViewCell.swift
//  Happy Meals
//
//  Created by Ahmed Yamany on 08/09/2022.
//

import UIKit

class SiginUpCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "SiginUpCollectionViewCell"
    
    lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
       let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    
    
}

//
//  SiginUpCollectionViewCell.swift
//  Happy Meals
//
//  Created by Ahmed Yamany on 08/09/2022.
//

import UIKit

class AppBriefCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "AppBriefCollectionViewCell"
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var textLabel: UIHappyLabel = UIHappyLabel()
    
    lazy var descriptionLabel: UILabel = {
       let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(textLabel)
        contentView.addSubview(descriptionLabel)
        configureConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    
    func configureConstraints(){
        
        let imageViewConstraints = [
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: contentView.frame.height*(2/3))
        ]
        
        let textLabelConstraints = [
            textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            textLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ]
        
        let descriptionLabelConstraints = [
            descriptionLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20),
            descriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 255)
        ]
        
        
        NSLayoutConstraint.activate(imageViewConstraints + textLabelConstraints + descriptionLabelConstraints)
    }
    
    
    
}

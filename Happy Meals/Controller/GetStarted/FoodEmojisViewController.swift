//
//  ViewController.swift
//  Happy Meals
//
//  Created by Ahmed Yamany on 06/09/2022.
//

import UIKit

class FoodEmojisViewController: UIViewController {
    // MARK: - SubViews
    lazy var collectionView: UICollectionView = {
       let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewLayout())
        collectionView.collectionViewLayout = self.configureCollecctionViewLayout()
        collectionView.isScrollEnabled = false
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "foodCell")
        return collectionView
    }()
    
    lazy var happyView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constants.shared.backgroudColor
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    lazy var happyLabel: UILabel = {
        let label = UILabel()
        label.text = "Happy Meals"
        label.font = .systemFont(ofSize: 38, weight: .bold)
        label.textColor = .systemBackground
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    lazy var happyDescription: UILabel = {
       let label = UILabel()
        label.text = "Discover the best foods from over 1,000 Resturants."
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textColor = .systemBackground
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var happyButton: UIHappyButton = {
       let button = UIHappyButton()
        button.backgroundColor = .systemBackground
        
        var configuration = UIButton.Configuration.plain()
        configuration.title = "Get Started"
        configuration.baseForegroundColor = UIColor.label
        button.configuration = configuration
        
        button.addTarget(self, action: #selector(self.happyButtonAction), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Properties
    let emojisList = "🥚🍗🍟🥘🍣🍳🍖🥙🍝🍱🥓🧇🥞🧈🥩🍔🍕🧆🥪🫓🌮🌯🫔🥗🫙🥫🫕🍜🍲🍛🦪🥟🫙🥫🫕🍜🍲🍛🦪🥟"
    
    // MARK: - Views
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        view.addSubview(happyView)
        happyView.addSubview(happyLabel)
        happyView.addSubview(happyDescription)
        happyView.addSubview(happyButton)
        UIView.animate(withDuration: 0) {
            self.configureConstraints()

            self.view.layoutIfNeeded()

        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.0, options:.curveEaseIn, animations: {
                self.happyView.heightAnchor.constraint(equalToConstant: self.view.frame.height/3).isActive = true
                self.view.layoutIfNeeded()
            }, completion:nil)
        }
    }
    
    // MARK: - HappyButton Action
    @objc func happyButtonAction(){
        let VC = UINavigationController(rootViewController: AppBriefViewController())
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true, completion: nil)
    }
    
    
    // MARK: - Configure Constraints
    func configureConstraints(){

        let collectionViewConstaints = [
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.widthAnchor.constraint(equalToConstant: view.frame.width),
            collectionView.bottomAnchor.constraint(equalTo: happyView.topAnchor)
        ]
        
        let happyViewConstraints = [
            happyView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            happyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            happyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            happyView.widthAnchor.constraint(equalToConstant: view.frame.width),
        ]
        
        
        NSLayoutConstraint.activate(happyViewConstraints)
        NSLayoutConstraint.activate(collectionViewConstaints)
        configureHappyViewConstraints()
    }
    
    func configureHappyViewConstraints(){
        
        let happyViewSubViewsConstraints = [
            happyLabel.topAnchor.constraint(equalTo: happyView.topAnchor, constant: 20),
            happyLabel.leadingAnchor.constraint(equalTo: happyView.leadingAnchor, constant: 20),
            happyLabel.widthAnchor.constraint(equalToConstant: 250),
            happyDescription.topAnchor.constraint(equalTo: happyLabel.bottomAnchor, constant: 20),
            happyDescription.leadingAnchor.constraint(equalTo: happyLabel.leadingAnchor),
            happyDescription.trailingAnchor.constraint(equalTo: happyLabel.trailingAnchor),
            happyButton.topAnchor.constraint(equalTo: happyDescription.bottomAnchor, constant: 20),
            happyButton.leadingAnchor.constraint(equalTo: happyLabel.leadingAnchor),
            happyButton.widthAnchor.constraint(equalToConstant: 160),
            
        ]
        NSLayoutConstraint.activate(happyViewSubViewsConstraints)

    }
    
}

// MARK: - CollectionViewLayout
extension FoodEmojisViewController{
    func configureCollecctionViewLayout() -> UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/5), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated((self.collectionView.frame.height/8) - 5))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 5)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
            return section
        }
        
        return layout
    }
}

// MARK: - CollectionView DataSource
extension FoodEmojisViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as UICollectionViewCell
        let label = UILabel()
        label.text = emojisList[indexPath.row]
        label.frame = cell.bounds
        label.font = .systemFont(ofSize: 50, weight: .bold)
        label.textAlignment = .center
        cell.addSubview(label)
        
        return cell
    }
    
    
    
}


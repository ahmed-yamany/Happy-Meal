//
//  SigInUPViewController.swift
//  Happy Meals
//
//  Created by Ahmed Yamany on 08/09/2022.
//

import UIKit

class SigInUPViewController: UIViewController {
    // MARK: - SubViews
    lazy var collectionView: UICollectionView = {
       let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewLayout())
        collectionView.collectionViewLayout = self.configureCollecctionViewLayout()
        collectionView.isScrollEnabled = false
//        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(SiginUpCollectionViewCell.self , forCellWithReuseIdentifier: SiginUpCollectionViewCell.reuseIdentifier)
        return collectionView
    }()
    
    lazy var happyView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var pageController: UIPageControl = {
        let pageController = UIPageControl()
        pageController.translatesAutoresizingMaskIntoConstraints = false
        
        pageController.pageIndicatorTintColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        pageController.currentPageIndicatorTintColor = Constants.shared.backgroudColor
        pageController.backgroundStyle = .minimal
        pageController.numberOfPages = 3
        pageController.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        pageController.currentPage = 1
        return pageController
    }()
    
    
    // MARK: - Views
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // MARK: - add right bar item
        let rightBarItem = UIBarButtonItem(title: "Log in", style: .done, target: self, action: #selector(self.LoginBarItemActoin))
        rightBarItem.tintColor = Constants.shared.backgroudColor
        navigationItem.rightBarButtonItem = rightBarItem
        
        // MARK: - Configure subviews
        view.addSubview(happyView)
        happyView.addSubview(pageController)
        configureConstraints()

    }
    
    // MARK: - RightBarItem Actoin
    @objc func LoginBarItemActoin(){
        
    }
    
    // MARK: - Configure Constraints
    func configureConstraints(){

        let happyViewConstraints = [
            happyView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            happyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            happyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            happyView.heightAnchor.constraint(equalToConstant: view.frame.height/3),
            pageController.centerXAnchor.constraint(equalTo: happyView.centerXAnchor),
            pageController.topAnchor.constraint(equalTo: happyView.topAnchor),
        ]

        NSLayoutConstraint.activate(happyViewConstraints)
    }
}

// MARK: - CollectionViewLayout
extension SigInUPViewController{
    func configureCollecctionViewLayout() -> UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
        
        return layout
    }
}


// MARK: - CollectionView DataSource
//extension SigInUPViewController: UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//    }
//
//
//}

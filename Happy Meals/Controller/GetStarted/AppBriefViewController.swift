//
//  SigInUPViewController.swift
//  Happy Meals
//
//  Created by Ahmed Yamany on 08/09/2022.
//

import UIKit

class AppBriefViewController: UIViewController {
    // MARK: - SubViews
    lazy var collectionView: UICollectionView = {
       let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewLayout())
        collectionView.collectionViewLayout = self.configureCollecctionViewLayout()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isUserInteractionEnabled = false
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.register(AppBriefCollectionViewCell.self , forCellWithReuseIdentifier: AppBriefCollectionViewCell.reuseIdentifier)
        
        return collectionView
    }()
    
    lazy var happyView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageController)
        view.addSubview(stackView)
        return view
    }()
    
    lazy var pageController: UIPageControl = {
        let pageController = UIPageControl()
        pageController.translatesAutoresizingMaskIntoConstraints = false
        
        pageController.pageIndicatorTintColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        pageController.currentPageIndicatorTintColor = Constants.shared.backgroudColor
        pageController.backgroundStyle = .minimal
        pageController.numberOfPages = self.collectionImages.count
        pageController.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        return pageController
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(self.createAccountButton)
        stackView.addArrangedSubview(facebookButton)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 20
        
        
        return stackView
    }()
    
    lazy var createAccountButton: UIHappyButton = {
       let button = UIHappyButton()
        
        button.backgroundColor = Constants.shared.backgroudColor
        var configuration = UIButton.Configuration.plain()
        configuration.title = "Create Account"
        configuration.baseForegroundColor = .systemBackground
        button.configuration = configuration
        button.addTarget(self, action: #selector(self.createAccounButtontAction), for: .touchUpInside)
        
        return button
    }()
    
    lazy var facebookButton: UIHappyButton = {
       let button = UIHappyButton()
        button.backgroundColor = UIColor(red: 242/255, green: 240/255, blue: 247/255, alpha: 1)
        var configuration = UIButton.Configuration.plain()
        configuration.title = "Continue with facebook"
        configuration.image = UIImage(named: "facebook")
        configuration.imagePadding = 10
        configuration.baseForegroundColor = .black
        button.configuration = configuration
        
        button.addTarget(self, action: #selector(self.facebookAButtonction), for: .touchUpInside)

        return button
    }()
    
    // MARK: - Properties
    let collectionImages = [
        SiginUPModel(image: UIImage(named: "findFoods")!, text: "Find Foods you love", description: "Discover the best foods from over 1,000 restaurants"),
        SiginUPModel(image: UIImage(named: "fastDelivery")!, text: "Fast Delivery", description: "Fast Delivery to your home, office and wherever you are."),
        SiginUPModel(image: UIImage(named: "liveTracking")!, text: "Live tracking", description: "Real Time tracking of your food on the app after ordered")
    ]
    var collectionViewCurrentIndex = 0
    var timer: Timer!
    

    // MARK: - Views
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        // MARK: - add right bar item
        let rightBarItem = UIBarButtonItem(title: "Log in", style: .done, target: self, action: #selector(self.LoginBarItemActoin))
        rightBarItem.tintColor = Constants.shared.backgroudColor
        navigationItem.rightBarButtonItem = rightBarItem
        
        
        // MARK: - Configure subviews
        view.addSubview(collectionView)
        view.addSubview(happyView)
        configureConstraints()
        playTimer()
        
    }
    
    // MARK: - view buttons Actions
    @objc func LoginBarItemActoin(){
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @objc func createAccounButtontAction(){
        let signupVC = SignUpViewController()
        
        navigationController?.pushViewController(signupVC, animated: true)
    }
    
    @objc func facebookAButtonction(){
        
        
    }
    
    // timer to scroll collection view automatecally
    func playTimer(){
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.scrollToItem), userInfo: nil, repeats: true)
        
    }
    
    @objc func scrollToItem(){
        collectionViewCurrentIndex += 1
        if collectionViewCurrentIndex > collectionImages.count-1{
            collectionViewCurrentIndex = 0
        }

        collectionView.scrollToItem(at: IndexPath(row: 0, section: collectionViewCurrentIndex), at: .centeredHorizontally, animated: true)
        pageController.currentPage = collectionViewCurrentIndex

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
            happyView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            happyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            happyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            happyView.heightAnchor.constraint(equalToConstant: view.frame.height/4),
            
            pageController.centerXAnchor.constraint(equalTo: happyView.centerXAnchor),
            pageController.topAnchor.constraint(equalTo: happyView.topAnchor, constant: 10),
            
            stackView.centerXAnchor.constraint(equalTo: happyView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: happyView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: happyView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: happyView.trailingAnchor)
            
            
        ]
        NSLayoutConstraint.activate(collectionViewConstaints)
        NSLayoutConstraint.activate(happyViewConstraints)
    }
}

// MARK: - CollectionViewLayout
extension AppBriefViewController{
    func configureCollecctionViewLayout() -> UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            
//            section.orthogonalScrollingBehavior = .groupPaging
            return section
        }
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.scrollDirection = .horizontal
        layout.configuration = configuration
        
        return layout
    }
}


// MARK: - CollectionView DataSource
extension AppBriefViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return collectionImages.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppBriefCollectionViewCell.reuseIdentifier, for: indexPath) as? AppBriefCollectionViewCell else{return UICollectionViewCell()}
        
        let model = collectionImages[indexPath.section]
        cell.imageView.image = model.image
        cell.textLabel.text = model.text
        cell.descriptionLabel.text = model.description
        return cell
    }
}



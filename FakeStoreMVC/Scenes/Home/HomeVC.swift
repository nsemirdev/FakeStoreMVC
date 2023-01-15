//
//  HomeVC.swift
//  FakeStoreMVC
//
//  Created by Emir Alkal on 15.01.2023.
//

import UIKit
import SnapKit
import SDWebImage

final class HomeVC: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var products = [Product]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    // MARK: - UI Elements
    
    fileprivate let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.barTintColor = UIColor(named: "PrimaryColor")
        searchBar.searchTextField.textColor = UIColor(named: "PrimaryColor")
        searchBar.placeholder = "Search term here"
        searchBar.tintColor = UIColor(named: "SecondaryColor")
        searchBar.searchTextField.backgroundColor = UIColor(named: "SecondaryColor")
        UISearchBar.appearance().tintColor = UIColor.black
        
        return searchBar
    }()
    
    fileprivate lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: view.frame.size.width / 2 - 24, height: 230)
        layout.sectionInset = .init(top: 8, left: 12, bottom: 8, right: 12)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.cellId)
        collectionView.backgroundColor = .systemTeal
        
        return collectionView
    }()
    
    // MARK: - UI Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        layout()
        getProducts()
    }
    
    // MARK: - Methods
    
    fileprivate func configure() {
        view.backgroundColor = UIColor(named: "PrimaryColor")
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
        view.addSubview(searchBar)
        view.addSubview(collectionView)
    }
    
    fileprivate func layout() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom)
        }
    }
    
    fileprivate func getProducts() {
        APICaller.shared.getProducts { result in
            switch result {
            case .success(let products):
                self.products = products
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.cellId , for: indexPath) as! ProductCell
        cell.imageView.sd_setImage(with: URL(string: products[indexPath.item].image))
        cell.priceLabel.text = "$\(products[indexPath.item].price)  "
        cell.productNameLabel.text = products[indexPath.item].title
        return cell
    }
}

extension HomeVC: UISearchBarDelegate {}

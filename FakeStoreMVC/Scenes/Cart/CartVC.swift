//
//  CartVC.swift
//  FakeStoreMVC
//
//  Created by Emir Alkal on 15.01.2023.
//

import UIKit
import SnapKit

final class CartVC: UIViewController {
    
    var basketItems = [Product]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    fileprivate let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CartTableCell.self, forCellReuseIdentifier: CartTableCell.cellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemTeal
        tableView.rowHeight = 170
        return tableView
    }()
    
    fileprivate let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
    
    fileprivate let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Clear Basket", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        button.setImage(UIImage(systemName: "xmark")?.withRenderingMode(.alwaysOriginal), for: .normal)
        var config = UIButton.Configuration.filled()
        config.baseForegroundColor = UIColor(named: "SecondaryColor")
        config.baseBackgroundColor = UIColor(named: "PrimaryColor")
        config.imagePadding = 10
        button.configuration = config
        return button
    }()
    
    fileprivate let purchaseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Purchase", for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 21, weight: .bold)
        button.setImage(UIImage(systemName: "creditcard")?.withRenderingMode(.alwaysOriginal), for: .normal)
        var config = UIButton.Configuration.filled()
        config.baseForegroundColor = UIColor(named: "PrimaryColor")
        config.baseBackgroundColor = UIColor(named: "SecondaryColor")
        config.imagePadding = 10
        button.configuration = config
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        tableView.dataSource = self
        configure()
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        basketItems = (tabBarController!.viewControllers![0] as! HomeVC).basketItems
        print(basketItems)
    }
    
    fileprivate func configure() {
        view.addSubview(tableView)
        view.addSubview(stackView)
        stackView.addArrangedSubview(clearButton)
        stackView.addArrangedSubview(purchaseButton)
    }
    
    fileprivate func layout() {
        tableView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(-180)
        }
        
        stackView.snp.makeConstraints { make in
            make.leadingMargin.trailingMargin.equalToSuperview()
            make.top.equalTo(tableView.snp.bottom).offset(10)
            make.bottom.equalToSuperview().offset(-116)
        }
    }
}

extension CartVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basketItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTableCell.cellId, for: indexPath) as! CartTableCell
        cell.productImageView.sd_setImage(with: URL(string: basketItems[indexPath.row].image))
        cell.titleLabel.text = basketItems[indexPath.row].title
        cell.detailLabel.text = basketItems[indexPath.row].description
        return cell
    }
    
    
}

//
//  ProductCell.swift
//  FakeStoreMVC
//
//  Created by Emir Alkal on 15.01.2023.
//

import UIKit
import SnapKit

final class ProductCell: UICollectionViewCell {
    static let cellId = "ProductCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    let productNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(named: "PrimaryColor")
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.6
        label.numberOfLines = 2
        return label
    }()
    
    let innerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .thin)
        label.textColor = UIColor(named: "PrimaryColor")
        return label
    }()
    
    let addToCardButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add to Basket", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "PrimaryColor")
        button.layer.cornerRadius = 4
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        layout()
    }
    
    fileprivate func configure() {
        contentView.backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 20
        
        addSubview(imageView)
        addSubview(stackView)
        stackView.addArrangedSubview(productNameLabel)
        stackView.addArrangedSubview(innerStackView)
        innerStackView.addArrangedSubview(priceLabel)
        innerStackView.addArrangedSubview(addToCardButton)
    }
    
    fileprivate func layout() {
        imageView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.height.equalTo(120)
        }
        
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(imageView)
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//
//  CartTableCell.swift
//  FakeStoreMVC
//
//  Created by Emir Alkal on 15.01.2023.
//

import UIKit
import SnapKit

final class CartTableCell: UITableViewCell {

    static let cellId = "CartTableCell"
    
    fileprivate let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .init(width: 3, height: 3)
        view.layer.shadowOpacity = 1.0
        return view
    }()
    
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    let outerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    let innerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "PrimaryColor")
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemTeal
        addSubview(containerView)
        containerView.addSubview(productImageView)
        containerView.addSubview(outerStackView)
        outerStackView.addArrangedSubview(innerStackView)
        innerStackView.addArrangedSubview(titleLabel)
        innerStackView.addArrangedSubview(detailLabel)
        layout()
    }
    
    fileprivate func layout() {
        containerView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(8)
            make.trailing.bottom.equalToSuperview().offset(-8)
        }
        
        productImageView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.width.equalTo(productImageView.snp.height)
        }
        
        outerStackView.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.top)
            make.bottom.equalTo(productImageView.snp.bottom)
            make.leading.equalTo(productImageView.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

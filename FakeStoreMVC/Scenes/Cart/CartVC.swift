//
//  CartVC.swift
//  FakeStoreMVC
//
//  Created by Emir Alkal on 15.01.2023.
//

import UIKit

final class CartVC: UIViewController {
    
    var badgeCount: String? {
        didSet {
            print("happened")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
    }
    


}

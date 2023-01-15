//
//  HomeVC.swift
//  FakeStoreMVC
//
//  Created by Emir Alkal on 15.01.2023.
//

import UIKit

final class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        APICaller.shared.getProducts { result in
            switch result {
            case .success(let products):
                print(products)
            case .failure(let error):
                print(error)
            }
        }
    }

}

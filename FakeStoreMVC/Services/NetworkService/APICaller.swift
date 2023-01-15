//
//  APICaller.swift
//  FakeStoreMVC
//
//  Created by Emir Alkal on 15.01.2023.
//

import Foundation

final class APICaller {
    private init() {}
    static let shared = APICaller()
    
    fileprivate static let host = "https://fakestoreapi.com/"
    
    struct Endpoints {
        static var products: String { "\(host)products" }
    }
    
    func getProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        guard let url = URL(string: Endpoints.products) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(.failure(error!))
                return
            }
            
            guard let data else { return }
            let decoder = JSONDecoder()
            
            do {
                let products = try decoder.decode([Product].self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

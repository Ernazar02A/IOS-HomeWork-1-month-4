//
//  ProductManager.swift
//  IOS-HomeWork-1
//
//  Created by MacBook Pro on 13/5/23.
//

import Foundation

struct ProductManager {
    
    static let shared = ProductManager()
    let urlString = "https://dummyjson.com/products"
    
    func getRequest(completion: @escaping (Result<Welcome, Error>) -> Void) {
        let url = URL(string: urlString)
        
        let request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else {return}
            
            do {
                let productData = try JSONDecoder().decode(Welcome.self, from: data)
                completion(.success(productData))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

//
//  File.swift
//  DynamicTable
//
//  Created by Ankita  on 16/12/20.
//  Copyright © 2020 Ankita . All rights reserved.
//

import Foundation
struct ApiClient{
    
    /// Genric function to fetch data from  api where T  is  of type Decodable
    /// - Parameters:
    ///   - url: pass  api url as String
    ///   - completion: On completion pass the returns Decodable object on success or error on failure
    func fetchData<T: Decodable>(url : String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion( Result.failure(NetworkError.invalidUrl))
                    return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard (response as? HTTPURLResponse) != nil  else {
                completion(Result.failure(.internetUnavailabilityError))
              return
            }
            guard let data = data, error == nil else {
                    completion(.failure(.dataFetchError))
                return
            }
            guard let dataString = String(data: data, encoding: String.Encoding.isoLatin1) else { return }
            guard let convertedData = dataString.data(using: .utf8, allowLossyConversion: true) else { return }
            do{
                let facts = try JSONDecoder().decode(T.self, from: convertedData)
                completion(.success(facts))
            } catch{
                completion(.failure(.decodingError))
            }
        }.resume()
        
    }

}

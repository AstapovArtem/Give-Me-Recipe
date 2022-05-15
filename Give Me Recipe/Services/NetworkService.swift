//
//  NetworkService.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 12.05.2022.
//

import UIKit
import Foundation
import Alamofire

class NetworkService {
    
    func fetchRecipe(from url:MealURLRequests, completion: @escaping (SearchResponse?) -> Void) {
        guard let urlRequest = URL(string: url.rawValue) else { return }
        
        let address: Alamofire.URLRequestConvertible = URLRequest(url: urlRequest)
        AF.request(address).responseData { dataResponse in
            if let error = dataResponse.error {
                print("Error received requestiong data: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = dataResponse.data else { return }
            
            let decoder = JSONDecoder()
            do {
                let objects = try decoder.decode(SearchResponse.self, from: data)
                completion(objects)
            } catch let jsonError {
                print("Failed to decode JSON", jsonError)
                completion(nil)
            }
        }
    }
    
}

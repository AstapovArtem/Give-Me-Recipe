//
//  RecipeInteractor.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 08.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire

protocol RecipeBusinessLogic {
    func makeRequest(request: Recipe.Model.Request.RequestType)
}

class RecipeInteractor: RecipeBusinessLogic {
    
    var presenter: RecipePresentationLogic?
    var service: RecipeService?
    var networkService = NetworkService()
    
    func makeRequest(request: Recipe.Model.Request.RequestType) {
        if service == nil {
            service = RecipeService()
        }
        
        switch request {
        case .getDataMealImage(urlString: let urlString):
            networkService.fetchImage(from: urlString) { [weak self] data in
                guard let data = data else {
                    return
                }
                
                self?.presenter?.presentData(response: .presentMealImage(data: data))
            }
        }
    }
    
}

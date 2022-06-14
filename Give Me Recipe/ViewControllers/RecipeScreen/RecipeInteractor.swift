//
//  RecipeInteractor.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 08.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire
import CoreData

protocol RecipeBusinessLogic {
    func makeRequest(request: Recipe.Model.Request.RequestType)
}

class RecipeInteractor: RecipeBusinessLogic {
    
    var presenter: RecipePresentationLogic?
    var service: RecipeService?
    var networkService = NetworkService()
    private let dataManager = DataManager()
    
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
            
        case .addFavouriteRecipe(viewModel: let viewModel):
            let succesReply = dataManager.addRecipeToFavourites(recipe: viewModel)
            presenter?.presentData(response: .presentReplyFromAddingFavouriteRecipe(reply: succesReply))
            
        case .checkIsRecipeFavourite(id: let id):
            let isFavourite = dataManager.checkIsRecipeFavourite(id: id)
            presenter?.presentData(response: .presentIsRecipeFavourite(isFavourite: isFavourite))
            
        case .deleteFavouriteRecipe(id: let id):
            dataManager.deleteRecipeFromFavourites(id: id)
            presenter?.presentData(response: .presentDeletionFavouriteRecipe)
        }
    }
    
}

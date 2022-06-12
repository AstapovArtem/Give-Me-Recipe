//
//  FavouriteRecipesInteractor.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 07.06.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FavouriteRecipesBusinessLogic {
    func makeRequest(request: FavouriteRecipes.Model.Request.RequestType)
}

class FavouriteRecipesInteractor: FavouriteRecipesBusinessLogic {
    
    var presenter: FavouriteRecipesPresentationLogic?
    var service: FavouriteRecipesService?
    private let dataManager = DataManager()
    
    func makeRequest(request: FavouriteRecipes.Model.Request.RequestType) {
        if service == nil {
            service = FavouriteRecipesService()
        }
        
        switch request {
            
        case .fetchMyFavouriteRecipes:
            let favouriteRecipes = dataManager.getMyFavouriteRecipes()
            presenter?.presentData(response: .presentFavouriteRecipes(myFavouriteRecipes: favouriteRecipes))
            
        case .deleteFavouriteRecipe(id: let id):
            dataManager.deleteRecipeFromFavourites(id: id)
            presenter?.presentData(response: .presentDeletionFavouriteRecipe)
        }
    }
}

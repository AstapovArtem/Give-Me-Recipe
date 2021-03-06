//
//  MainScreenInteractor.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 07.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MainScreenBusinessLogic {
    func makeRequest(request: MainScreen.Model.Request.RequestType)
}

class MainScreenInteractor: MainScreenBusinessLogic {
    
    var presenter: MainScreenPresentationLogic?
    var service: MainScreenService?
    private var networkService: NetworkService = NetworkService()
    
    func makeRequest(request: MainScreen.Model.Request.RequestType) {
        if service == nil {
            service = MainScreenService()
        }
        
        switch request {
        case .getRandomRecipe:
            networkService.fetchRecipe(from: MealURLRequests.randomRecipe) { [weak self] response in
                guard let response = response else {
                    return
                }

                self!.presenter?.presentData(response: .presentRandomRecipe(response: response))
            }
            
        case .getFavouriteRecipesScreen:
            presenter?.presentData(response: .presentFavouritesRecipesScreen)
        }
    }
    
}

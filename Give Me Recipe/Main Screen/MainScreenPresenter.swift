//
//  MainScreenPresenter.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 07.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MainScreenPresentationLogic {
    func presentData(response: MainScreen.Model.Response.ResponseType)
}

class MainScreenPresenter: MainScreenPresentationLogic {
    weak var viewController: MainScreenDisplayLogic?
    
    func presentData(response: MainScreen.Model.Response.ResponseType) {
        
        switch response {
        case .presentRandomRecipe:
            viewController?.displayData(viewModel: .displayRandomRecipe)
        }
    }
    
}

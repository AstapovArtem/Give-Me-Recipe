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
    
    func makeRequest(request: MainScreen.Model.Request.RequestType) {
        if service == nil {
            service = MainScreenService()
        }
        
        switch request {
        case .getRandomRecipe:
            presenter?.presentData(response: .presentRandomRecipe)
        }
    }
    
}

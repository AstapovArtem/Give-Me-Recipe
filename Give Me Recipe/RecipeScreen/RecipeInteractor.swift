//
//  RecipeInteractor.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 08.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RecipeBusinessLogic {
  func makeRequest(request: Recipe.Model.Request.RequestType)
}

class RecipeInteractor: RecipeBusinessLogic {

  var presenter: RecipePresentationLogic?
  var service: RecipeService?
  
  func makeRequest(request: Recipe.Model.Request.RequestType) {
    if service == nil {
      service = RecipeService()
    }
  }
  
}

//
//  RecipePresenter.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 08.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RecipePresentationLogic {
  func presentData(response: Recipe.Model.Response.ResponseType)
}

class RecipePresenter: RecipePresentationLogic {
  weak var viewController: RecipeDisplayLogic?
  
  func presentData(response: Recipe.Model.Response.ResponseType) {
  
  }
  
}
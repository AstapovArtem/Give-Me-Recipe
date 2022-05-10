//
//  MainScreenModels.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 07.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum MainScreen {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getRandomRecipe
      }
    }
    struct Response {
      enum ResponseType {
        case presentRandomRecipe
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case displayRandomRecipe
      }
    }
  }
  
}

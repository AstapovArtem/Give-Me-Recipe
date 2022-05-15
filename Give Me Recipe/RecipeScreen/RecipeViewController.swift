//
//  RecipeViewController.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 08.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RecipeDisplayLogic: class {
    func displayData(viewModel: Recipe.Model.ViewModel.ViewModelData)
}

class RecipeViewController: UIViewController, RecipeDisplayLogic {
    
    var interactor: RecipeBusinessLogic?
    var router: (NSObjectProtocol & RecipeRoutingLogic)?
    
    private var recipeViewModel: MealRecipeViewModel!
    
    var navigationViewControllerDelegate: NavigationViewControllerDelegate?
    
    // MARK: Object lifecycle
    
    init(recipeViewModel: MealRecipeViewModel, nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.recipeViewModel = recipeViewModel
        setup()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController        = self
        let interactor            = RecipeInteractor()
        let presenter             = RecipePresenter()
        let router                = RecipeRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }
    
    // MARK: Routing
    
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func displayData(viewModel: Recipe.Model.ViewModel.ViewModelData) {
        
    }
    
}

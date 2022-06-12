//
//  FavouriteRecipesViewController.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 07.06.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import CoreData

protocol FavouriteRecipesDisplayLogic: class {
    func displayData(viewModel: FavouriteRecipes.Model.ViewModel.ViewModelData)
}

class FavouriteRecipesViewController: UITableViewController, FavouriteRecipesDisplayLogic {
    
    var interactor: FavouriteRecipesBusinessLogic?
    var router: (NSObjectProtocol & FavouriteRecipesRoutingLogic)?
    
    private var favouriteRecipes: [MealRecipeViewModel]!
    
    private let cellId = "cellId"
    
    // MARK: Object lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
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
        let interactor            = FavouriteRecipesInteractor()
        let presenter             = FavouriteRecipesPresenter()
        let router                = FavouriteRecipesRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }
    
    private func setupTableViewDelegateAndDataSource() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    // MARK: Routing
    
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewDelegateAndDataSource()
        interactor?.makeRequest(request: .fetchMyFavouriteRecipes)
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillLayoutSubviews() {
        setupTableViewElement()
        //        tableView.reloadData()
    }
    
    // MARK: Display data
    
    func displayData(viewModel: FavouriteRecipes.Model.ViewModel.ViewModelData) {
        switch viewModel {
            
        case .displayMyFavouritesRecipes(favouriteRecipes: let favouriteRecipes):
            self.favouriteRecipes = favouriteRecipes
            tableView.reloadData()
            
        case .displaySuccessDeletionFavouriteRecipe:
            interactor?.makeRequest(request: .fetchMyFavouriteRecipes)
        }
    }
    
    // MARK: Setup ui elements
    
    private func setupTableViewElement() {
        tableView.anchor(top: view.topAnchor,
                         leading: view.leadingAnchor,
                         bottom: view.bottomAnchor,
                         trailing: view.trailingAnchor)
        
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }
    
    // MARK: Table view delegate and data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteRecipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        guard let cell = cell else { return UITableViewCell() }
        
        let recipe = favouriteRecipes[indexPath.row]
        var content = cell.defaultContentConfiguration()
        if let pictureURL = recipe.picture {
            let mealImage = NetworkService().fetchImage(from: pictureURL) { data in
                guard let data = data else { return }
                content.image = UIImage(data: data)
                print("Image")
            }
        }
        content.text = favouriteRecipes[indexPath.row].name
        cell.contentConfiguration = content
        print("Return")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("delete")
        }
    }
    
    // MARK: Set NavigationViewControllerDelegate
    
    func setNavigationControllerDelegate(with delegate: NavigationViewControllerDelegate) {
        router?.navigationViewControllerDelegate = delegate
    }
    
}

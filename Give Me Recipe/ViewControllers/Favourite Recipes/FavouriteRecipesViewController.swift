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
    
    // MARK: UI Elements
    
    private var emptyRecipesView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var emptyRecipesImage: UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "emptyRecipes"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        return imageView
    }()
    
    private var emptyRecipesLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Favourite recipes are empty!"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private var emptyElementsStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
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
        
        let nib = UINib(nibName: "Cell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MealCell.reuseId)
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
        
        if favouriteRecipes.count == 0 {
            setupEmptyRecipesView()
        } else {
            setupTableViewElement()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        interactor?.makeRequest(request: .fetchMyFavouriteRecipes)
    }
    
    // MARK: Display data
    
    func displayData(viewModel: FavouriteRecipes.Model.ViewModel.ViewModelData) {
        switch viewModel {
            
        case .displayMyFavouritesRecipes(favouriteRecipes: let favouriteRecipes):
            self.favouriteRecipes = favouriteRecipes
            tableView.reloadData()
            
        case .displaySuccessDeletionFavouriteRecipe:
            interactor?.makeRequest(request: .fetchMyFavouriteRecipes)
            
        case .displaySelectedRecipe(recipe: let recipe):
            router?.openSelectedRecipe(recipe: recipe)
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
    
    private func setupEmptyRecipesView() {
        view.addSubview(emptyRecipesView)
        emptyRecipesView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), size: CGSize(width: view.frame.width, height: view.frame.height))
        
        emptyRecipesView.addSubview(emptyRecipesImage)
        emptyRecipesImage.centerXAnchor.constraint(equalTo: emptyRecipesView.centerXAnchor).isActive = true
        emptyRecipesImage.topAnchor.constraint(equalTo: emptyRecipesView.topAnchor, constant: 150).isActive = true
        
        emptyRecipesView.addSubview(emptyRecipesLabel)
        emptyRecipesLabel.centerXAnchor.constraint(equalTo: emptyRecipesView.centerXAnchor).isActive = true
        emptyRecipesLabel.topAnchor.constraint(equalTo: emptyRecipesImage.bottomAnchor, constant: 20).isActive = true
        emptyRecipesLabel.widthAnchor.constraint(equalTo: emptyRecipesView.widthAnchor, multiplier: 0.7).isActive = true
    }
        
    // MARK: Table view delegate and data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteRecipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MealCell.reuseId, for: indexPath) as! MealCell
        let recipe = favouriteRecipes[indexPath.row]
        
        let mealVM = MealCellViewModel(pictureUrlString: recipe.picture ?? "",
                                       mealName: recipe.name,
                                       type: recipe.category,
                                       area: recipe.area)
        
        cell.setCell(viewModel: mealVM)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deleteRecipe = favouriteRecipes[indexPath.row]
            interactor?.makeRequest(request: .deleteFavouriteRecipe(id: deleteRecipe.id))
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRecipe = favouriteRecipes[indexPath.row]
        
        interactor?.makeRequest(request: .openSelectedRecipe(recipe: selectedRecipe))
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    // MARK: Set NavigationViewControllerDelegate
    
    func setNavigationControllerDelegate(with delegate: NavigationViewControllerDelegate) {
        router?.navigationViewControllerDelegate = delegate
    }
    
}

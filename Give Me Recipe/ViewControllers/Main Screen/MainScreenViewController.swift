//
//  MainScreenViewController.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 07.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MainScreenDisplayLogic: class {
    func displayData(viewModel: MainScreen.Model.ViewModel.ViewModelData)
}

class MainScreenViewController: UIViewController, MainScreenDisplayLogic {
    
    var interactor: MainScreenBusinessLogic?
    var router: (NSObjectProtocol & MainScreenRoutingLogic)?
    
    // MARK: UI Elements
    
    private var backgroundImage: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "background")
        imageView.alpha = 0.35
        return imageView
    }()
    
    private var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Recipe for any cases"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var findRandomRecipeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Random recipe", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.layer.cornerRadius = 15
        button.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.6784313725, blue: 0.2823529412, alpha: 1)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemGray5.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 220).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }()
    
    private var favouriteRecipesButton: UIButton = {
        let button = UIButton()
        button.setTitle("My favourite recipes", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.layer.cornerRadius = 15
        button.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.6784313725, blue: 0.2823529412, alpha: 1)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemGray5.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 220).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }()
    
    
    // MARK: Object lifecycle
    
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
        let interactor            = MainScreenInteractor()
        let presenter             = MainScreenPresenter()
        let router                = MainScreenRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }
    
    // MARK: Routing
    
    @objc private func openRandomRecipe() {
        interactor?.makeRequest(request: .getRandomRecipe)
    }
    
    @objc private func openFavouriteRecipes() {
        interactor?.makeRequest(request: .getFavouriteRecipesScreen)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        setupViewController()
        setupRandomRecipeButton()
        setupFavouriteRecipesButton()
        setupTextLabel()
    }
    
    // MARK: Setup elements
    
    private func setupViewController() {
        view.addSubview(backgroundImage)
        backgroundImage.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        backgroundImage.center = view.center
    }
    
    private func setupTextLabel() {
        view.addSubview(textLabel)
        textLabel.bottomAnchor.constraint(equalTo: findRandomRecipeButton.topAnchor, constant: -100).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupRandomRecipeButton() {
        view.addSubview(findRandomRecipeButton)
        findRandomRecipeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        findRandomRecipeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        findRandomRecipeButton.addTarget(self, action: #selector(openRandomRecipe), for: .touchUpInside)
        findRandomRecipeButton.layer.shadowOffset = CGSize(width: 2.5, height: 4)
        findRandomRecipeButton.layer.shadowOpacity = 0.4
        findRandomRecipeButton.layer.shadowRadius = 3
    }
    
    private func setupFavouriteRecipesButton() {
        view.addSubview(favouriteRecipesButton)
        favouriteRecipesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        favouriteRecipesButton.topAnchor.constraint(equalTo: findRandomRecipeButton.bottomAnchor, constant: 20).isActive = true
        favouriteRecipesButton.addTarget(self, action: #selector(openFavouriteRecipes), for: .touchUpInside)
        favouriteRecipesButton.layer.shadowOffset = CGSize(width: 2.5, height: 4)
        favouriteRecipesButton.layer.shadowOpacity = 0.4
        favouriteRecipesButton.layer.shadowRadius = 3
    }
    
    func displayData(viewModel: MainScreen.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayRandomRecipe(let viewModel):
            router?.openRandomRecipe(from: viewModel)
            
        case .displayFavouriteRecipesScreen:
            router?.openFavouritesRecipes()
        }
    }
    
    func setNavigationControllerDelegate(with delegate: NavigationViewControllerDelegate) {
        router?.navigationViewControllerDelegate = delegate
    }
    
}

//
//  IngredientCell.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 24.05.2022.
//

import UIKit

class IngredientCell: UITableViewCell {
    
    static var reuseId = "IngredientCell"
    
    var ingredientName: String
    var ingredientMeasure: String
    var imageForCell = UIImage(systemName: "app.fill")
    
    init(ingredientName: String, ingredientMeasure: String) {
        self.ingredientName = ingredientName
        self.ingredientMeasure = ingredientMeasure
        
        super.init(style: .default, reuseIdentifier: IngredientCell.reuseId.description)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var cell: UITableViewCell = {
       let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.image = UIImage(systemName: "app.fill")
        return cell
    }()
    
}

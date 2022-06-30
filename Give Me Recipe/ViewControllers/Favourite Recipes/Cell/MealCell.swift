//
//  MealCell.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 30.06.2022.
//

import UIKit
import Kingfisher

class MealCell: UITableViewCell {
    
    static let reuseId = "MealCell"
    
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealTypeLabel: UILabel!
    @IBOutlet weak var mealAreaLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        mealImageView.layer.cornerRadius = mealImageView.frame.width / 2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setCell(viewModel: MealCellViewModel) {
        
        if let url = URL(string: viewModel.pictureUrlString) {
            mealImageView.kf.setImage(with: url)
        }
        
        mealNameLabel.text = viewModel.mealName
        mealTypeLabel.text = viewModel.type
        mealAreaLabel.text = viewModel.area
    }

}

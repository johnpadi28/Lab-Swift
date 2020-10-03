//
//  HomeTableViewCell.swift
//  Pizza Delivery
//
//  Created by John Padilla on 10/2/20.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var styleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    @IBOutlet var pizzaImage: UIImageView!{
        didSet{
            pizzaImage.layer.cornerRadius = pizzaImage.bounds.width / 2
            pizzaImage.clipsToBounds = true
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

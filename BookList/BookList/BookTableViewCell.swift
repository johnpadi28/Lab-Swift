//
//  BookTableViewCell.swift
//  BookList
//
//  Created by John Padilla on 10/20/20.
//

import UIKit

protocol BookTableViewDelegate {
    func favoriteButtonTapped(cell: BookTableViewCell)
}

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var delegate: BookTableViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        
        delegate?.favoriteButtonTapped(cell: self)
    }

    func configure(with book: Book, isFavorite: Bool, delegate: BookTableViewDelegate) {
        titleLabel.text = book.title
        setFavorite(isFavorite)
        self.delegate = delegate
    }
    
    func setFavorite(_ isFavorite: Bool) {
        if isFavorite {
            favoriteButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        }
    }
}

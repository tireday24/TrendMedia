//
//  SearchTableViewCell.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/07/19.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var searchTextLabel: UILabel!
    
    func configureCell(data: Movie) {
        nameLabel.font = .boldSystemFont(ofSize: 15)
        nameLabel.text = data.title
        dateLabel.text = "\(data.releaseDate) | \(data.runtime) |\(data.rate)점"
        searchTextLabel.text = data.overview
        searchTextLabel.numberOfLines = 0
        
    }
    
}

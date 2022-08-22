//
//  todoTableViewCell.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/08/22.
//

import UIKit

class todoTableViewCell: UITableViewCell {
    
    static let identifier = "todoTableViewCell"

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var todoLable: UILabel!
    @IBOutlet weak var starButton: UIButton!
    
    
    func configureCell() {
        checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        starButton.setImage(UIImage(systemName: "star"), for: .normal)
    }
    
}

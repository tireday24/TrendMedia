//
//  GlassesTableViewCell.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/07/21.
//

import UIKit

class GlassesTableViewCell: UITableViewCell {
    
    static let identifier = "GlassesTableViewCell"

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var titleLable: UILabel!
    
    func configure() {
        numberLabel.text = ""
        numberLabel.textColor = .black
        titleLable.text = "영화 상세 정보"
        titleLable.textColor = .black
    }
    
    
}

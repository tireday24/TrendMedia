//
//  BookCollectionViewCell.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/07/20.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bookDate: UILabel!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookBackgroundView: UIView!
    
    func configureCell(data: Movie) {
        bookTitle.font = .boldSystemFont(ofSize: 20)
        bookTitle.text = data.title
        bookTitle.textColor = .white
        bookDate.text = data.releaseDate
        bookDate.textColor = .white
        bookImage.image = data.imageView[0]
        //bookBackgroundView.backgroundColor = [0]
    }
    
}

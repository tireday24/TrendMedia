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
    
    var viewColor : [UIColor] = [.systemBlue, .systemRed, .systemMint, .purple, .orange, .systemPink]
    
    func configureCell(data: Movie) {
        bookTitle.font = .boldSystemFont(ofSize: 20)
        bookTitle.text = data.title
        bookTitle.textColor = .white
        //bookTitle.numberOfLines = 0
        bookDate.text = data.releaseDate
        bookDate.textColor = .white
        bookImage.image = data.imageView[0]
        bookBackgroundView.backgroundColor = .systemGray
        bookBackgroundView.layer.cornerRadius = 10
        bookBackgroundView.clipsToBounds = true
        bookBackgroundView.layer.shadowColor = UIColor.black.cgColor
        bookBackgroundView.layer.shadowOpacity = 0.9
        bookBackgroundView.layer.shadowRadius = 10
        bookBackgroundView.backgroundColor = viewColor.randomElement()
    }
    
}

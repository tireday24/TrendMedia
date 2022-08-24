//
//  ImageView.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/08/24.
//

import UIKit

class DetailImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUp() {
        contentMode = .scaleToFill
        layer.borderWidth = Constants.Design.borderWidth
        layer.cornerRadius = Constants.Design.cornerRadius
        layer.borderColor = Color.BaseColor.border
    }
    
    
    
}

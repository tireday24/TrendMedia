//
//  Lable.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/08/24.
//

import UIKit

class DetailLable: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUp() {
        layer.borderWidth = Constants.Design.borderWidth
        layer.borderColor = Color.BaseColor.border
        layer.cornerRadius = Constants.Design.cornerRadius
        textColor = .black
        font = UIFont(name: "AmericanTypewriter-Bold ", size: 20)
        textAlignment = .center
    }
}

//
//  Button.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/08/24.
//

import UIKit

class DetailButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        layer.borderWidth = Constants.Design.borderWidth
        layer.borderColor = UIColor.black.cgColor
    }
}

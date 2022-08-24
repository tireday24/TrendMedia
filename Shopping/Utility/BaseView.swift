//
//  BaseView.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/08/24.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureUI() {
        
    }
    
    func setConstraints() {
        
    }
    
}

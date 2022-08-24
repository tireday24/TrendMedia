//
//  DetailView.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/08/24.
//

import UIKit

import SnapKit
import Then

class DetailView: BaseView {
    
    //photo -> imageView
    let itemPhoto: DetailImageView = {
        let view = DetailImageView(frame: .zero)
        return view
    }()
    
    //todo
    let itemLable: DetailLable = {
        let lable = DetailLable()
        return lable
    }()
    
    //star -> button
    let starButton = DetailButton().then {
        $0.setTitle("즐겨찾기", for: .normal)
    }
    
    //check -> button
    let checkButton = DetailButton().then {
        $0.setTitle("체크", for: .normal)
    }
    
    let sendButton = DetailButton().then {
        $0.setTitle("결과 값 보내기", for: .normal)
        $0.backgroundColor = .black
    
    }
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        [itemPhoto, itemLable, starButton, checkButton, sendButton].forEach {
            self.addSubview($0)
        }
    
    }
    
    override func setConstraints() {
        
        itemLable.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(self.safeAreaLayoutGuide)
            make.width.equalTo(200)
            make.height.equalTo(100)
            make.centerX.equalTo(self)
        }
        
        itemPhoto.snp.makeConstraints { make in
            make.top.equalTo(itemLable.snp.bottom).offset(10)
            make.width.equalTo(200)
            make.height.equalTo(400)
            make.trailing.leading.equalTo(self.safeAreaLayoutGuide)
        }
        

        starButton.snp.makeConstraints { make in
            make.top.equalTo(itemPhoto.snp.bottom).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.trailing.leading.equalTo(self.safeAreaLayoutGuide)

        }

        checkButton.snp.makeConstraints { make in
            make.top.equalTo(starButton.snp.bottom).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.trailing.leading.equalTo(self.safeAreaLayoutGuide)
        }
        
        sendButton.snp.makeConstraints { make in
            make.top.equalTo(checkButton.snp.bottom).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.trailing.leading.equalTo(self.safeAreaLayoutGuide)
        }

        
    }

    
    
}



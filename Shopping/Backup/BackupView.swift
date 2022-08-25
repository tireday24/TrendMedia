//
//  BackupView.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/08/25.
//

import UIKit

import SnapKit
import Then

class BackupView: BaseView {
    let backUpBoutton = DetailButton().then {
        $0.setTitle("백업하기", for: .normal)
        $0.backgroundColor = .lightGray
        
    }
    
    let restoreButton = DetailButton().then {
        $0.setTitle("복구하기", for: .normal)
        $0.backgroundColor = .systemGray
    }
    
    let backUpTableView = UITableView().then {
        $0.backgroundColor = .lightGray
        $0.rowHeight = 80
    }
    
    let backupProgressView: UIProgressView = {
        let view = UIProgressView()
        view.progress = 0.0
        view.progressTintColor = .blue
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func configureUI() {
        [backUpBoutton, restoreButton,backUpTableView, backupProgressView].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
        backUpBoutton.snp.makeConstraints { make in
            make.top.equalTo(backupProgressView.snp.bottom).offset(20)
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        
        restoreButton.snp.makeConstraints { make in
            make.top.equalTo(backUpBoutton.snp.bottom).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        
        backUpTableView.snp.makeConstraints { make in
            make.topMargin.equalTo(restoreButton.snp.bottom).offset(10)
            make.trailing.equalTo(-20)
            make.leading.equalTo(20)
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
        
        backupProgressView.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            
        }
    }
}

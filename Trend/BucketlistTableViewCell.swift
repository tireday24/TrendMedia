//
//  BucketlistTableViewCell.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/07/19.
//

import UIKit

class BucketlistTableViewCell: UITableViewCell {
    //Identifier 만들자
    static let identifier = "BucketlistTableViewCell"

    @IBOutlet weak var chexkboxButton: UIButton!
    @IBOutlet weak var bucketlistLabel: UILabel!
    @IBOutlet weak var titleLable: UILabel!
    
    //액션 넣으면 모든 버튼이 다 눌림 , 셀을 재사용하기 때문에
}

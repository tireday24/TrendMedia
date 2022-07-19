//
//  SearchTableViewController.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/07/19.
//

import UIKit


class SearchTableViewController: UITableViewController {
    
    var imageViewArray: [UIImage] = [#imageLiteral(resourceName: "7번방의선물.png"), #imageLiteral(resourceName: "광해.png"), #imageLiteral(resourceName: "명량.png"), #imageLiteral(resourceName: "아바타.png"), #imageLiteral(resourceName: "어벤져스엔드게임.png"), #imageLiteral(resourceName: "겨울왕국2.png")]
    var movieNameArray = ["명량", "아바타", "어벤져스엔드게임", "7번방의 선물", "겨울왕국2", "광해"]
    var dateArray = ["2022.07.01", "2022.07.02", "2022.07.03", "2022.07.04", "2022.07.05", "2022.07.06", "2022.07.07"]
    var textTextArray = ["a", "aa", "aaa", "aaaa", "aaaaa", "aaaaa"]

    override func viewDidLoad() {
        print("viewdidload")
        super.viewDidLoad()

        tableView.rowHeight = 60
        tableView.backgroundColor = .black
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return imageViewArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageViewArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell

        //row 설정
        cell.searchImageView.image = imageViewArray[indexPath.row]
        cell.nameLabel.text = movieNameArray[indexPath.row]
        cell.dateLabel.text = dateArray[indexPath.row]
        cell.searchTextLabel.text = textTextArray[indexPath.row]

        cell.searchImageView.contentMode = .scaleAspectFit

        cell.nameLabel.textColor = .black
        cell.dateLabel.textColor = .black
        cell.searchTextLabel.textColor = .black

        cell.nameLabel.font = .systemFont(ofSize: 12)
        cell.dateLabel.font = .systemFont(ofSize: 8)
        cell.searchTextLabel.font = .systemFont(ofSize: 10)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
}
}

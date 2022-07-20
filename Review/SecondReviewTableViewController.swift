//
//  SecondReviewTableViewController.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/07/20.
//

import UIKit

class SecondReviewTableViewController: UITableViewController {
    
    var movieList = MovieInfo()
    //["암살", "괴물", "헤리포터와 해리포터 해리포터", "내 머리속의 지우개", "기묘한 이야기", "라라랜드", "라이언 일병 구하기", "외계+인"]

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    //셀의 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.movie.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondReviewTableViewCell", for: indexPath) as! SecondReviewTableViewCell
        
        let data = movieList.movie[indexPath.row]
        cell.configureCell(data: data)
        
        return cell
        
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //device 전체 높이
        return UIScreen.main.bounds.height / 8
    }
  

}

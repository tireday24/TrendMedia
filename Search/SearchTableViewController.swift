//
//  SearchTableViewController.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/07/19.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    var movieList = MovieInfo()

    override func viewDidLoad() {
        print("viewdidload")
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "처음으로", style: .plain, target: self, action: #selector(resetButtonClicked))
        
    }
    
    @objc func resetButtonClicked() {
        
        //iOS 13+ SceneDelegate 쓸 때 동작하는 코드
        //appdelegate -> scenedelegate first 처음 의미
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        //sceneDelegate -> Scenedelegate 전체 거기서 delegate로 감 기존에 쌓여있던 화면들이 메모리에서 내려감
        
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        sceneDelegate?.window?.rootViewController = vc
        sceneDelegate?.window?.makeKeyAndVisible()
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.movie.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        let data = movieList.movie[indexPath.row]
        cell.configureCell(data: data)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 8
}
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("didselectRowAt") // 동작하지 않는다면? 1. TableView가 noSelection 2. 셀 위에 전체 버튼
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RecommandCollectionViewController") as! RecommandCollectionViewController
        
        //2. 값 전달 - vc가 가지고 있는 프로퍼티에 데이터 넣기(초기화)
        vc.movieData = movieList.movie[indexPath.row]
        
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

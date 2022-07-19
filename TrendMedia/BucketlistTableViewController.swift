//
//  BucketlistTableViewController.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/07/19.
//

import UIKit

class BucketlistTableViewController: UITableViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    
    var list = ["범죄도시2", "탑건", "토르"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80
        
        list.append("헤어질 결심")
        list.append("마녀2")

      
    }
    
    @IBAction func userTextFieldReturn(_ sender: UITextField) {
        
        list.append(sender.text!)
        // 중요!
        tableView.reloadData()
        //특정 섹션과 특정 row 만 바꿀 수 있다
        //tableView.reloadSections(IndexSet(, with: )
        //tableView.reloadRows(at: [IndexPath(row: 0, section: 0),IndexPath(row: 1, section: 0)], with: .fade)
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //indexPath customcell로 넘김
        //스토리보드 상에서 테이블 뷰 셀을 가져온거임
        // 매개변수가 왜 존재하나? 스토리보드 빌더 상에서 Ui를 가져오는 작업
        let cell = tableView.dequeueReusableCell(withIdentifier: "BucketlistTableViewCell", for: indexPath) as! BucketlistTableViewCell // as? 타입 캐스팅
        
        cell.bucketlistLabel.text = list[indexPath.row]
        cell.bucketlistLabel.font = .boldSystemFont(ofSize: 18)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        //편집이 가능한 상태로 만들 수 있음 true 설정 시
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            list.remove(at: indexPath.row)
            tableView.reloadData()    }
        
    
}
}

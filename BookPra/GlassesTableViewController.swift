//
//  GlassesTableViewController.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/07/21.
//

import UIKit

class GlassesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "상세 정보"
       

    }
    
   
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GlassesTableViewCell.identifier, for: indexPath) as! GlassesTableViewCell
        
        cell.configure()
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didselectRowAt") // 동작하지 않는다면? 1. TableView가 noSelection 2. 셀 위에 전체 버튼
        let sb = UIStoryboard(name: "BookProject", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

  
}

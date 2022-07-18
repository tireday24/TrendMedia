//
//  SettingTableViewController.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/07/18.
//

import UIKit



class SettingTableViewController: UITableViewController {
    
    var totalSettingArray = ["공지사항", "실험실", "버전정보"]
    var personalSettingArray = ["개인/보안", "알림", "채팅", "멀티프로필"]
    var etcArray = ["고객센터/도움말"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //섹션의 갯수 - 3
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    //헤더
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "전체 설정"
        } else if section == 1 {
            return "개인 설정"
        } else if section == 2 {
            return "기타"
        }
        return "오류"
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return ""
    }
    
    //세션 갯수
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            // 첫번째 섹션의 Count(갯수)
            return totalSettingArray.count
        } else if section == 1 {
            // 두번쩨 섹션의 count( 갯수) Return 갯수 써도 무관
            return personalSettingArray.count
        } else if section == 2 {
            return etcArray.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell")!
        
        if indexPath.section == 0 {
            cell.textLabel?.text = totalSettingArray[indexPath.row]
            
            // cell.textLable?.text = totalSettingArrary[0]
            
            cell.textLabel?.font = .boldSystemFont(ofSize: 15)
            cell.textLabel?.textColor = .systemGray
        } else if indexPath.section == 1 {
            cell.textLabel?.text = personalSettingArray[indexPath.row]
            cell.textLabel?.textColor = .systemGray
            cell.textLabel?.font = .boldSystemFont(ofSize: 15)
        } else if indexPath.section == 2 {
            cell.textLabel?.text = etcArray[indexPath.row]
            cell.textLabel?.textColor = .systemGray
            cell.textLabel?.font = .boldSystemFont(ofSize: 15)
        }
        return cell 
    }
    
    

  
}

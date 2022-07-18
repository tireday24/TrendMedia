//
//  AttensionModeTableViewController.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/07/18.
//

import UIKit

class AttensionModeTableViewController: UITableViewController {
    @IBOutlet var attensionTableView: UITableView!
    
// var modeArray = ["방해 금지 모드", "수면", "업무", "개인 시간"]
//    var shareArray = ["모든 기기에서 공유"]
//
    override func viewDidLoad() {
        super.viewDidLoad()
        self.attensionTableView.register(UITableViewCell.self, forCellReuseIdentifier: "AttensionMode")
        self.attensionTableView.delegate = self
        self.attensionTableView.dataSource = self
        
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "모드 설정"
//        } else if section == 1 {
//            return ""
//        }
//        return ""
//    }
//
//    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        if section == 0 {
//            return "집중 모드에서는 경고 및 알림 소리가 울리지 않습니다"
//        } else if section == 1 {
//            return "이 기기에서 집중 모드를 켜면 사용자의 다른 기기에서도 집중 모드가 켜집니다"
//        }
//        return ""
//    }
//
//
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "AttensionMode")!
//
//        if indexPath.section == 0 {
//            cell.textLabel?.text = modeArray[indexPath.row]
//            cell.textLabel?.textColor = .white
//            cell.textLabel?.font = .systemFont(ofSize: 15)
//        } else if indexPath.section == 1 {
//            cell.textLabel?.text = shareArray[indexPath.row]
//            cell.textLabel?.textColor = .white
//            cell.textLabel?.font = .systemFont(ofSize: 15)
//
//            let switchView = UISwitch(frame: .zero)
//            switchView.setOn(false, animated: true)
//            switchView.tag = indexPath.row
//            switchView.addTarget(self, action: #selector(self.switchDidChange(_:)), for: .valueChanged)
//            cell.accessoryView = switchView
//        }
//
//
//
//        return cell
//
//
//
//    }
//
//    @objc func switchDidChange(_ sender: UISwitch) {
//        print("sender is \(sender.tag)")
//    }

}

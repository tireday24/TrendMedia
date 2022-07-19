//
//  SettingTableViewController.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/07/18.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var birthdayFriend = ["a", "b", "c", "d", "e"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //섹션의 갯수(옵션)
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "셍일인 친구"
        } else if section == 1 {
            return "즐겨찾기"
        } else if section == 2 {
            return "친구 140명"
        }
        return "섹션"
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "푸터"
    }
    
    //1. 셀의 갯수 numberOfRowsInSection
    //ex. 카톡 100명 > 셀 100개 . 3000명 > 셀 3000개
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return birthdayFriend.count
        } else if section == 1 {
            return 5
        } else {
            return 2
        }
        
    }
    
    //2. 셀의 디자인과 데이터(필수) cellForRowAt 섹션마다 셀 갯수가 다르다
    //ex. 카톡 이름, 프사, 상메 등
    // 재사용 메커니즘
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("cellforrowat", indexPath)

        if indexPath.section == 2 {

            let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
            cell.textLabel?.text = "2번인 인덱스 섹션의 텍스트"
            cell.textLabel?.textColor = .systemMint
            cell.textLabel?.font = .boldSystemFont(ofSize: 20)
            cell.detailTextLabel?.text = "디테일 레이블"

            if indexPath.row % 2 == 0 {
                cell.imageView?.image = UIImage(systemName: "star")
                cell.backgroundColor = .lightGray
            } else {
                cell.imageView?.image = UIImage(systemName: "star.fill")
                cell.backgroundColor = .white
            }

            return cell

        } else  {

            let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
            if indexPath.section == 0 {

                if indexPath.row == 0 {
                    cell.textLabel?.text = birthdayFriend[indexPath.row]
                } else if indexPath.row == 1 {
                    cell.textLabel?.text = birthdayFriend[indexPath.row]
                } else if indexPath.row == 2 {
                    cell.textLabel?.text = birthdayFriend[indexPath.row]
                }


                cell.textLabel?.text = birthdayFriend[indexPath.row]
                cell.textLabel?.textColor = .systemBlue
                cell.textLabel?.font = .boldSystemFont(ofSize: 20)
            } else if indexPath.section == 1 {
                cell.textLabel?.text = "1번 인덱스 텍스트"
                cell.textLabel?.textColor = .systemPink
                cell.textLabel?.font = .boldSystemFont(ofSize: 20)
            }

            return cell
        
        }
    }
}
        
        
        //복붙과 같은 효과
//        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
//
//
//
//        if indexPath.section == 0 {
//
//            if indexPath.row == 0 {
//                cell.textLabel?.text = birthdayFriend[indexPath.row]
//            } else if indexPath.row == 1 {
//                cell.textLabel?.text = birthdayFriend[indexPath.row]
//            } else if indexPath.row == 2 {
//                cell.textLabel?.text = birthdayFriend[indexPath.row]
//            }
//
//
//            cell.textLabel?.text = birthdayFriend[indexPath.row]
//            cell.textLabel?.textColor = .systemBlue
//            cell.textLabel?.font = .boldSystemFont(ofSize: 20)
//        } else if indexPath.section == 1 {
//            cell.textLabel?.text = "1번 인덱스 텍스트"
//            cell.textLabel?.textColor = .systemPink
//            cell.textLabel?.font = .boldSystemFont(ofSize: 20)
//        } else if indexPath.section == 2 {
//            cell.textLabel?.text = "2번인 인덱스 섹션의 텍스트"
//            cell.textLabel?.textColor = .systemMint
//            cell.textLabel?.font = .boldSystemFont(ofSize: 20)
//        }
//
//        return cell
//
//        }
//
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        if indexPath.section == 0 && indexPath.row == 0 {
//            return 400
//        } else {
//            return 44
//        }
//    }
     
//}


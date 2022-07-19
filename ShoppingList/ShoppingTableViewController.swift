//
//  ShoppingTableViewController.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/07/19.
//

import UIKit
enum todoText: Int, CaseIterable {
    case textField, label
    
    var sectionTitle : String {
        switch self {
        case .textField:
            return ""
        case .label:
            return ""
        }
    }
    
    var rowTitle : [String] {
        switch self {
        case .textField:
            return [""]
        case .label:
            return ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
        }
    }
}


class ShoppingTableViewController: UITableViewController {

    @IBOutlet weak var shoppingLabel: UILabel!
    
    
    
    var labelArray = ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80
        labelDesign()
    }
    
    
    // 텍스트필드에 텍스트 추가시 자동 추가
    @IBAction func textFieldReturn(_ sender: UITextField) {
        labelArray.append(sender.text!)
        tableView.reloadData()
        
    }
    
    //"쇼핑" 레이블 디자인
    func labelDesign() {
        shoppingLabel.text = "쇼핑"
        shoppingLabel.textAlignment = .center
        shoppingLabel.textColor = .black
        shoppingLabel.font = .boldSystemFont(ofSize: 30)
    }
    
    
    //섹션 갯수
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //row 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 4
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell

            cell.shoppingTextField.attributedPlaceholder = NSAttributedString(string: "무엇을 구매하실 건가요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemGray])
            cell.shoppingButton.setTitle("추가", for: .normal)
            cell.shoppingButton.setTitleColor(.black, for: .normal)
            cell.shoppingButton.backgroundColor = .gray
            cell.shoppingButton.layer.cornerRadius = 10
            cell.shoppingButton.clipsToBounds = true
            
            return cell
                
        } else if indexPath.section == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "todoTableViewCell", for: indexPath) as! ShoppingTableViewCell

            cell.todoLabel.text = labelArray[indexPath.row]
            cell.todoLabel.textColor = .black
            cell.todoLabel.font = .boldSystemFont(ofSize: 20)

            if indexPath.row == 0 {

                cell.todoImageView.image = UIImage(systemName: "checkmark.square.fill")
                cell.backgroundColor = .white
            } else {
                cell.todoImageView.image = UIImage(systemName: "checkmark.square")
                cell.backgroundColor = .white
            }

            if indexPath.row == 0 {
                cell.todoButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
                cell.backgroundColor = .white
            } else {
                cell.todoButton.setImage(UIImage(systemName: "star"), for: .normal)
                cell.backgroundColor = .white
            }
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "todoTableViewCell", for: indexPath) as! ShoppingTableViewCell
            return cell
        }
    }
    
    // 스와이프 옆에서 제거
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            labelArray.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
        
   

}

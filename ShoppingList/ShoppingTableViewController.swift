//
//  ShoppingTableViewController.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/07/19.
//

import UIKit

import RealmSwift
import SnapKit
import Then


class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet weak var todoTextField: UITextField!
    
    let localRealm = try! Realm()
    
    var todo: Results<TodoList>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todo = localRealm.objects(TodoList.self).sorted(byKeyPath: "date", ascending: true)
        print("Realm is located at:", localRealm.configuration.fileURL!)
        tableView.rowHeight = 80
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
        //화면 갱신은 화면 전환 코드 및 생명 주기 실행 점검 필요!
        //present, overCurrentContext, overFullScreen > viewWillAppear X
        todo = localRealm.objects(TodoList.self).sorted(byKeyPath: "date", ascending: false)
        tableView.reloadData()
    }
    
    
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        
        let todo = TodoList(todo: todoTextField.text ?? "데이터를 입력 해주세요", date: Date())
        
        try! localRealm.write {
            localRealm.add(todo) //여기서 Create가 일어난다 왜 try? 조금 더 안전하게 데이터를 저장 추가 가져오기 위함
            print("Realm Succeed")
            dismiss(animated: true)
            self.tableView.reloadData()
        }
        
        view.endEditing(true)
        
    }
    
    
    
    //row 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: todoTableViewCell.identifier, for: indexPath) as? todoTableViewCell else { return UITableViewCell()}
        cell.todoLable.text = todo[indexPath.row].todo
        cell.configureCell()
        cell.checkButton.addTarget(self, action: #selector(checkBoxButtonClicked), for: .touchUpInside)
        cell.checkButton.isSelected = todo[indexPath.row].check
        cell.starButton.addTarget(self, action: #selector(starButtonClicked), for: .touchUpInside)
        cell.checkButton.isSelected = todo[indexPath.row].star

        
        return cell
        
    }
        

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            try! localRealm.write{
                localRealm.delete(todo[indexPath.row])
            }
            tableView.reloadData()
    }
        
        
}
    @objc func checkBoxButtonClicked( _ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            sender.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            sender.isSelected = true
            sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        }
       
    }
    
    @objc func starButtonClicked( _ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            sender.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            sender.isSelected = true
            sender.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    
    
}

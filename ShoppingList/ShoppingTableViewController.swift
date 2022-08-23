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
    
    var todo: Results<TodoList>! {
        didSet {
            tableView.reloadData()
            print("Tasks Changed")
        }
    }
    
    var menuItems: [UIAction] {
        return [
            UIAction(title: "제목순", image: UIImage(systemName: "pencil"), handler: {  _ in
                self.todo = self.localRealm.objects(TodoList.self).sorted(byKeyPath: "todo", ascending: true)
            }),
            UIAction(title: "즐겨찾기순", image: UIImage(systemName: "star"), handler: { _ in
                self.todo = self.localRealm.objects(TodoList.self).sorted(byKeyPath: "star", ascending: true)
            }),
            UIAction(title: "할일순", image: UIImage(systemName: "checkmark"), handler: { _ in
                self.todo = self.localRealm.objects(TodoList.self).sorted(byKeyPath: "check", ascending: true)
            })
        ]
    }
    
    var menu: UIMenu {
        return UIMenu(title: "", image: nil, identifier: nil, options: [], children: menuItems)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todo = localRealm.objects(TodoList.self).sorted(byKeyPath: "date", ascending: true)
        print("Realm is located at:", localRealm.configuration.fileURL!)
        tableView.rowHeight = 80
        
        let navi = navigationItem
        navi.leftBarButtonItem = UIBarButtonItem(title: "", image: UIImage(systemName: "line.3.horizontal"), primaryAction: nil, menu: menu)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
        fetchRealm()
    }
    
    func fetchRealm() {
        todo = localRealm.objects(TodoList.self).sorted(byKeyPath: "date", ascending: false)
    }
    
    @objc func sortButtonClicked() {
        
        
        todo = localRealm.objects(TodoList.self).sorted(byKeyPath: "todo", ascending: true)
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
        
        cell.checkButton.tag = indexPath.row
        let check = todo[indexPath.row].check ? "checkmark.square.fill" : "checkmark.square"
        cell.checkButton.setImage(UIImage(systemName: check), for: .normal)
        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked(_:)), for: .touchUpInside)
        cell.starButton.tag = indexPath.row
        let star = todo[indexPath.row].star ? "star.fill" : "star"
        cell.starButton.setImage(UIImage(systemName: star), for: .normal)
        cell.starButton.addTarget(self, action: #selector(starButtonClicked(_:)), for: .touchUpInside)

        
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
    
    @objc func checkButtonClicked(_ sender: UIButton) {
        try! localRealm.write {
            todo[sender.tag].check = !todo[sender.tag].check
            self.localRealm.create(TodoList.self, value: ["objectId": self.todo[sender.tag].objectId, "todo": "완료"], update: .modified)
        }
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
    
    @objc func starButtonClicked(_ sender: UIButton) {
        try! localRealm.write {
            todo[sender.tag].star = !todo[sender.tag].star
        }
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
    
}

        
       
    
   
 

//
//  dataViewController.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/08/23.
//

import UIKit
import RealmSwift
import Kingfisher

class DetailViewController: BaseViewController {
    
    let mainView = DetailView()
  
    override func loadView() {
        self.view = mainView
    }
    
    var objectId: ObjectId?
    
    
    let localRealm = try! Realm()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
    
    override func configureUI() {
       
        let value = localRealm.object(ofType: TodoList.self, forPrimaryKey: objectId)
        mainView.itemLable.text = value?.todo
        let star = localRealm.object(ofType: TodoList.self, forPrimaryKey: objectId)
        if star?.star == true {
            mainView.starButton.backgroundColor = .yellow
        } else {
            mainView.starButton.backgroundColor = .lightGray
        }
        let check = localRealm.object(ofType: TodoList.self, forPrimaryKey: objectId)
        if check?.check == true {
            mainView.checkButton.backgroundColor = .red
        } else {
            mainView.checkButton.backgroundColor = .lightGray
        }
        let photo = localRealm.object(ofType: TodoList.self, forPrimaryKey: objectId)
        let url = URL(string: photo?.photo ?? "데이터 없음")
        mainView.itemPhoto.kf.setImage(with: url)
        
      
    }
    
  
}
    


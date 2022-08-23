//
//  dataViewController.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/08/23.
//

import UIKit
import RealmSwift

class DataViewController: UIViewController {
    
    @IBOutlet weak var dataLable: UILabel!
    @IBOutlet weak var likeDataLabel: UILabel!
    @IBOutlet weak var checkDataLable: UILabel!
    
    static let identifier = "DataViewController"
    
    var objectId: ObjectId?
    
    let localRealm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      getData()

        
    }
    
    func getData() {
        
        let value = localRealm.object(ofType: TodoList.self, forPrimaryKey: objectId)
        dataLable.text = value?.todo
        
        
        
    }
    
    
   
}
    


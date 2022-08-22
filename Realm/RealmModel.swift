//
//  RealmModel.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/08/22.
//

import Foundation

import RealmSwift

class TodoList: Object {
    @Persisted var todo: String // 해야 할 일 (필수)
    @Persisted var check: Bool // check 필수
    @Persisted var star: Bool // star 필수
    @Persisted var date: Date
    
    @Persisted(primaryKey: true) var objectId: ObjectId
   
    convenience init(todo: String, date: Date) {
        self.init()
        self.todo = todo
        self.date = date
        self.check = false
        self.star = false
    }
    
}

//
//  Reuseable.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/08/24.
//

import UIKit

protocol ReuseIdentifier {
    static var reuseIdentifier: String { get }
}

extension UIViewController: ReuseIdentifier {
    static var reuseIdentifier: String {
        String(describing: self)
    }
    
    
}

extension UITableViewCell: ReuseIdentifier {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
    
    


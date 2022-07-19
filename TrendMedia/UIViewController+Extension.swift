//
//  UIViewController+Extension.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/07/19.
//

import UIKit

extension UIViewController {
    
    func setBackgroundColor() {
        
        view.backgroundColor = .orange
        
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: "a", message: "v", preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
        
    }
    
    
}

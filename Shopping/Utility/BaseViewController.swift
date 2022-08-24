//
//  BaseViewController.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/08/24.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setConstraints()
        tapGesture()
    }
    
    func configureUI() {
        
    }
    
    func setConstraints() {
        
    }
    
    func tapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        tapGestureRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer ) {
        view.endEditing(true)
    }
    
}

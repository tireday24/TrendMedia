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
    
    func showAlert(title: String, button: String = "확인") { //매개변수 기본값
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let ok = UIAlertAction(title: button, style: .cancel)
        alert.addAction(ok)
        present(alert, animated: true)
        
    }
    
}

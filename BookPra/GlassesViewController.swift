//
//  GlassesViewController.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/07/21.
//

import UIKit

class GlassesViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "검색"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked)) //target self 내 화면에서 하겠다
        
    }
    
    @objc func closeButtonClicked() {
        self.dismiss(animated: true)
    }
    
    
    
}

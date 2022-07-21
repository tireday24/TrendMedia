//
//  SearchViewController.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/07/22.
//

import UIKit

class SearchBookViewController: UIViewController {
    
    @IBOutlet weak var targetWebViewButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "도서 상세"

      
       buttonDesign()
        
    }
    
    func buttonDesign() {
        targetWebViewButton.backgroundColor = .systemGray
        targetWebViewButton.setTitle("여기를 눌러주세요", for: .normal)
        
    }
    
    
    @IBAction func webViewButtonClicked(_ sender: UIButton) {
        
        //1.
        let storyboardFile = UIStoryboard(name: "BookProject", bundle: nil)
        
        //2. 스토리보드 안에 뷰컨트롤러로 가져옴
        let viewControllerPick = storyboardFile.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        
        //2.5 네비게이션 임베디드
        let navigationControllerPick = UINavigationController(rootViewController: viewControllerPick)
        
        //2.5 present시  화면 전환 방식 설정 (옵션)
        navigationControllerPick.modalPresentationStyle = .fullScreen
        
        //3. 어떤 방식으로 띄워줄건가
        self.present(navigationControllerPick, animated: true)
        
    }
    
}

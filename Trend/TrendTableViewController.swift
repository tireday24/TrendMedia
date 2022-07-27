//
//  TrendTableViewController.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/07/21.
//

import UIKit

class TrendTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    //화면 전환: 1. 스토리보드 파일 2. 스토리보드 내에 뷰컨트롤러 3. 화면 전환
    @IBAction func movieButtonClicked(_ sender: UIButton) {
        
        //영화버튼 클릭 -> BucketlistTableViewController Present
        // 아래서 위
        //1. 뷰컨트롤러가 있는 스토리보드파일 찾기
        //bundle 엡코드가 작성되는 영역 (왼쪽)
        //xcode내에서 가져오는 것은 Nil / nil 아닌 경우 다른 모듈, library
        let storyboardFile = UIStoryboard(name: "Trend", bundle: nil)
        
        //2. 스토리보드 안에 뷰컨트롤러로 가져옴
        let viewControllerPick = storyboardFile.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as! BucketlistTableViewController
        
        viewControllerPick.textFieldPlaceholder = "영화"
        //3. 어떤 방식으로 띄워줄건가
        self.present(viewControllerPick, animated: true)
        
    }
    
  
    @IBAction func dramaButtonClicked(_ sender: UIButton) {
        
        //1.
        let storyboardFile = UIStoryboard(name: "Trend", bundle: nil)
        
        //2. 스토리보드 안에 뷰컨트롤러로 가져옴
        let viewControllerPick = storyboardFile.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as! BucketlistTableViewController
        
        viewControllerPick.textFieldPlaceholder = "드라마"
        
        //2.5 present시  화면 전환 방식 설정 (옵션)
        viewControllerPick.modalPresentationStyle = .fullScreen
        
        //3. 어떤 방식으로 띄워줄건가
        self.present(viewControllerPick, animated: true)
    }
    
    @IBAction func bookButtonClicked(_ sender: UIButton) {
        
        //1.
        let storyboardFile = UIStoryboard(name: "Trend", bundle: nil)
        
        //2. 스토리보드 안에 뷰컨트롤러로 가져옴
        let viewControllerPick = storyboardFile.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as! BucketlistTableViewController
        
        viewControllerPick.textFieldPlaceholder = "도서"
        
        //2.5 네비게이션 임베디드
        let navigationControllerPick = UINavigationController(rootViewController: viewControllerPick)
        
        //2.5 present시  화면 전환 방식 설정 (옵션)
        navigationControllerPick.modalPresentationStyle = .fullScreen
        
        //3. 어떤 방식으로 띄워줄건가
        self.present(navigationControllerPick, animated: true)
        
    }
    
}

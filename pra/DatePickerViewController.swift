//
//  DatePickerViewController.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/07/18.
//

import UIKit

class DatePickerViewController: UIViewController {

    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //언제 아웃렛컬렉션을 사용하는 것이 좋을끼?
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var date2Label: UILabel!
    
    @IBOutlet weak var grayViewLeadingConstraints: NSLayoutConstraint!
    
    
    @IBOutlet var dateLabelCollection: [UILabel]!
    
    //dateformatter의 사용빈도가 많기 때문에 전역변수
    let format = DateFormatter()
    
    
    //왜 함수 밖에서 못 쓰나
    //클래스의 프로퍼티 언제 실행될지 모르기 때문에
    //함수 안쪽에서 사용되어야한다
//    format.dateFormat = "yyyy/MM/dd"
//    dataLabel.text = "1"
    
    
    //변수의 Scope
    // => 큰쪽에서 작은쪽으로는 부를 수 있지만 작은쪽에서 큰쪽으로는 부르지 못한다
    // 메모리 상에서 상위 범위에 호출하면 메모리에 올라갔다가 함수가 메모리에서 사라짐
    // 화면이 떠있는 동안 계속 사용하게 된다면 함수 밖에서 선언해주면 좋다
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //항상 데이트 표현이면 전역변수로 쓰자
        format.dateFormat = "yyyy/MM/dd"
        
        //초기화 구문이거나 진짜 함수이거나 뒤에 .init가 생략 되어있다
        //Init 생략 기준 반환해야하는 형태가 명확한 요소면 생략 가능
//        UIAlertController(title: "경고", message: "접근 하지 마세요", preferredStyle: .alert)
        
        //layout쪽 요소에 프로퍼티 따라 씀
        grayViewLeadingConstraints.constant = 120
        

    }
    
    func configureLabelDesign() {
        //1. OutletCollection(ex. UIView)
        for i in dateLabelCollection {
            i.font = .boldSystemFont(ofSize: 20)
            i.textColor = .brown
            
        }
        
        
        //양이 많아지면 index 활용이 안좋음 번거롭더라도 배열을 별도로 생성하고 주는게 더 낫다
        //변경시 처리하기 어려워짐
        //연결순서는 Print로 찍어보자(Index 번호)
        dateLabelCollection[0].text = "첫번째 텍스트"
        dateLabelCollection[1].text = "두번쩨 텍스트"
        
        //2. UILabel
        let labelArrary = [dataLabel, date2Label]
        for i in labelArrary {
            i?.font = .boldSystemFont(ofSize: 20)
            i?.textColor = .brown
            
        }
        
        dataLabel.text = "첫번째 텍스트"
        date2Label.text = "두번쩨 텍스트"
        
    }
    
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
        //dateFormatter 함수 쓰기 위해 초기화
//        let format = DateFormatter()
//        format.dateFormat = "yyyy/MM/dd"
        
        //dateformatter에서 받은 date를 dataLabel에서 쓰겠다
        dataLabel.text = format.string(from: sender.date)
        
        
        
    }
    
}

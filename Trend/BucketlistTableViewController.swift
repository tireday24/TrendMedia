//
//  BucketlistTableViewController.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/07/19.
//

import UIKit

struct Todo {
    var title: String
    var done: Bool
}

class BucketlistTableViewController: UITableViewController {
    
    static let identifier = "BucketlistTableViewController"
    
    //1. 값 전달
    // 옵셔널 스트링 타입으로 선언하더라도 오류가 뜨지 않는 이유는?
    //Placeholder 자체가 옵셔널이라면? 오류X
    // 하지만 string interporation(문자열 보간법)이라면?
    var textFieldPlaceholder : String?
    
    //클래스는 ReferenceType -> 인스턴스 자체를 변경하지 않는 이상 didSet 호출 한번만 된다
    //IBOutlet ViewDidLoad 호출 되기 전에 Nil이 아닌지 nil인지 알 수 있음
    //viewDidLoad전 실행
    //인스턴스(클래스) 자체를 변경하지 않는 이상 한번만 될거다가 한번만 코드실행된다
    @IBOutlet weak var userTextField: UITextField! {
        didSet {
            //한번만 호출된다 class내의 프로퍼티가 바뀌는거여서 uitextField 자체가 변경이 되어야 didSet이 추가로 불림
            //아웃렛 사용할때 주로 사용
            //viewDidload 호출시 사용됨
            userTextField.textAlignment = .center
            userTextField.font = .boldSystemFont(ofSize: 22)
            userTextField.textColor = .systemRed
            print("텍스트필드 Didset")
        }
    }
    
    // list 프로퍼티가 추가, 삭제 등 변경 되고 나서 테이블뷰를 항상 갱신!
    // 기존 과제에 녹여내보자 대상에 넣는게 좋다 데이터가 자주 바뀔 때 사용하자
    //체크박스에 대한 데이터를 가지고 있어야한다
    //딕셔너리로 값을 관리하면 될까? -> 딕셔너리는 순서가 없다 indsexPathrow 사용불가 태그 불가
    var list = [Todo(title: "범죄도시2", done: false), Todo(title: "탑건", done: false)] {
        //셀만 바꿀 때는 didset은 사용 x didset은 계속 호출되기 때문에
        didSet {
            // 배열이 바뀌면 업데이트 해주자
            tableView.reloadData()
            print("list가 변경됨 \(list), \(oldValue)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //값 전달
        userTextField.placeholder = "\(textFieldPlaceholder ?? "영화")를 입력해보세요"
        
        //xmark 안뜨면 네비게이션 임베디드 여부 확인
        navigationItem.title = "버킷리스트"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked)) //target self 내 화면에서 하겠다
        
        tableView.rowHeight = 80
        
        //list.append("헤어질 결심")
        //list.append("마녀2")
        
        
    }
    
    @objc func closeButtonClicked() {
        self.dismiss(animated: true)
    }
    
    @IBAction func userTextFieldReturn(_ sender: UITextField) {
        //글씨 공백 지움
        
        //if let
        //        if let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty, (2...6).contains(value.count){
        //            list.append(value)
        //            tableView.reloadData() // 테이블뷰 갱신
        //        } else {
        //            print("아무것도 입력하지 않았습니다")
        //        }
        //
        
        //guard let
        //        guard let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty, (2...6).contains(value.count) else {
        //            //Alert, toast를 통해서 빈칸을 입력했다 글자수가 많ㅇ다
        //            return
        //        }
        //        list.append(value)
        //        tableView.reloadData()
        //
        //list.append(sender.text!)
        // 중요!
        //tableView.reloadData()
        //특정 섹션과 특정 row 만 바꿀 수 있다
        //tableView.reloadSections(IndexSet(, with: )
        //tableView.reloadRows(at: [IndexPath(row: 0, section: 0),IndexPath(row: 1, section: 0)], with: .fade)
        
        //리스트에 작성을 했을 때 이름 받고 done은 false
        list.append(Todo(title: sender.text!, done: false))
        //tableView.reloadData()
        //갱신된 데이터를 cell에 반영시켜주기 위해
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //indexPath customcell로 넘김
        //스토리보드 상에서 테이블 뷰 셀을 가져온거임
        // 매개변수가 왜 존재하나? 스토리보드 빌더 상에서 Ui를 가져오는 작업
        let cell = tableView.dequeueReusableCell(withIdentifier: BucketlistTableViewCell.identifier, for: indexPath) as! BucketlistTableViewCell // as? 타입 캐스팅
        
        cell.bucketlistLabel.text = list[indexPath.row].title
        cell.bucketlistLabel.font = .boldSystemFont(ofSize: 18)
        
        //각 셀당 테그값이 설정 가능하다 self 내 버튼 눌렀을 때 움직이기겠다 sender를 통해 타입을 넘겨 받음
        cell.chexkboxButton.tag = indexPath.row
        cell.chexkboxButton.addTarget(self, action: #selector(chexkboxButtonClicked(sender:)), for: .touchUpInside)
        
        //cellforrowat에서 화면쪽에서 구현할 것을 구현
        let value = list[indexPath.row].done ? "checkmark.square.fill" : "checkmark.square"
        cell.chexkboxButton.setImage(UIImage(systemName: value), for: .normal)
        
        return cell
    }
    
    @objc func chexkboxButtonClicked(sender: UIButton) {
        print("\(sender.tag)번째 버튼 클릭")
        //데이터 쪽 구현
        
        //배열 인덱스를 찾아서 done을 바꿔야 된다 테이블 뷰 갱신
        //가지고 있는 값을 반대의 값으로 표현해준다
//        if list[sender.tag].done {
//            sender.setImage(UIImage(systemName: ""), for: .normal)
//            list[sender.tag].done = false
//        } else {
//            sender.setImage(UIImage(systemName: ""), for: .normal)
//            list[sender.tag].done = true
//        }
        
        list[sender.tag].done = !list[sender.tag].done
        
        //셀에 대한 갱신
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        
        //채우는 이미지로 설정 -> 빈박스로 돌아가는 코드가 없다
        //셀 재활용으로 버튼의 상태가 재활용됨
        //화면과 데이터는 따로 논다 -> 화면의 기반으로만 이미지를 바꾸어서
        //재사용 셀 오류확인용
        sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        //편집이 가능한 상태로 만들 수 있음 true 설정 시
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            list.remove(at: indexPath.row)
            //tableView.reloadData()
            
        }
        
        
    }
}

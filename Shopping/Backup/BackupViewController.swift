//
//  BackupViewController.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/08/25.
//

import UIKit

import Zip

class BackupViewController: BaseViewController {
    
    let mainView = BackupView()
    
    override func loadView() {
        self.view = mainView
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        mainView.backUpBoutton.addTarget(self, action: #selector(backupButton), for: .touchUpInside)
        mainView.restoreButton.addTarget(self, action: #selector(restoreButton), for: .touchUpInside)
        fetchDocumentZipFile()
    }
    
    override func configureUI() {
        //
    }
    
    override func setConstraints() {
        //
    }
    
    @objc func backupButton() {
        
        //경로 -> ~~/Document -> ~~~/Document/ - -> ~~/Document/default.realm O
        var urlPaths = [URL]()
        
        guard let path = documentDirectoryPath() else {
            showAlert(title: "도큐먼트 위치에 오류가 있습니다")
            return
        }
        
        let realmFile = path.appendingPathComponent("default.realm")
        
        guard FileManager.default.fileExists(atPath: realmFile.path) else {
            showAlert(title: "벡업할 파일이 없습니다")
            return
    }
        //확인 했으니까 무조건 있음 가지고 올 수 있다
        urlPaths.append(URL(string: realmFile.path)!)
        
        //압축 경로 찾고 경로 입력하고 압축
        //
        do {
            let zipFilePath = try Zip.quickZipFiles(urlPaths, fileName: "SeSACShoppingList_1")
            print("Archive Location: \(zipFilePath)")
            showActivityViewController()
        } catch {
            showAlert(title: "압축을 실패했습니다")
        }
}
    //외부 공유 성공시 띄운다
    func showActivityViewController() {
        
        //위치 파악
        guard let path = documentDirectoryPath() else {
            showAlert(title: "도큐먼트 위치에 오류가 있습니다")
            return
        }
        
        //이 부분이 zip 파일 path 구현이라 여기를 다르게 해주면 차등적으로 zip 생성
        let backupFileURL = path.appendingPathComponent("SeSACShoppingList_1.zip")
        
       let vc = UIActivityViewController(activityItems: [backupFileURL], applicationActivities: [])
        self.present(vc, animated: true)
        
    }
    
    @objc func restoreButton() {
        //아카이브 형태만 가져올거고 도큐먼트에서 복사 할거냐
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.archive], asCopy: true)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        self.present(documentPicker, animated: true)
    }
}

extension BackupViewController: UIDocumentPickerDelegate{
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print(#function)
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        
        //첫번째 경로 가져옴 백업된 url
        guard let selectedFileURL = urls.first else {
            showAlert(title: "선택하신 파일을 찾을 수 없습니다")
            return
        }
        
        guard let path = documentDirectoryPath() else {
            showAlert(title: "도큐먼트 위치에 오류가 있습니다")
            return
        }
        
        //선택된 경로의 가장 최근 경로 정보
        let sandboxFileURL = path.appendingPathComponent(selectedFileURL.lastPathComponent)
        
        
        //가장 최근 url 경로에 파일 있나?
        if FileManager.default.fileExists(atPath: sandboxFileURL.path) {
            
            //경로에다가 default.realm 부분에 zip
            let fileURL = path.appendingPathComponent("SeSACShoppingList_1.zip")
            
            do {
                //어떤 경로? / 압축 푸는 위치/  압축을 풀고 나면 거기에 있는 파일들이 나옴 덮어씌워 줄거냐 / 비밀번호 설정 할거임? / 프로그래스: 몇%풀렸는지 알려줌 다 풀리면 뭐해줄거야? 얼럿 띄우기
                //파일 경로 확실해서 , 도큐먼트 위치(도큐먼트 안), 덮어씌우는게 편함, 앱상에서는 비밀번호 건. 적 거의 없음 / 프로그래스는 로딩뷰를 채워줄 수 있는 뷰를 보여줄 수 있음 /
                try Zip.unzipFile(fileURL, destination: path, overwrite: true, password: nil, progress: { progress in
                    print("progress: \(progress)")
                }, fileOutputHandler: { unzippedFile in
                    print("unzippedFile: \(unzippedFile)")
                    self.showAlert(title: "복구가 완료되었습니다")
                })
                
            } catch {
                showAlert(title: "압축 해제에 실패했습니다")
            }
            
        } else { //파일 존재 안하면
            
            //파일 앱의 데이터를 이동 시켜주어야한다
            do {
                //파일 앱의 zip -> 도큐먼트 폴더에 복사
                //처음 선택 url , 도큐먼트 저장 위치
                try FileManager.default.copyItem(at: selectedFileURL, to: sandboxFileURL)
                
                let fileURL = path.appendingPathComponent("SeSACShoppingList_1.zip")
                
                try Zip.unzipFile(fileURL, destination: path, overwrite: true, password: nil, progress: { progress in
                    print("progress: \(progress)")
                }, fileOutputHandler: { unzippedFile in
                    print("unzippedFile: \(unzippedFile)")
                    self.showAlert(title: "복구가 완료되었습니다")
                })
                
            } catch {
                showAlert(title: "압축 해제에 실패했습니다.")
            }
 
        }
        
        
    }
}


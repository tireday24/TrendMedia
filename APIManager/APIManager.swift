//
//  APIManager.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/08/24.
//
import Foundation

import Alamofire
import SwiftyJSON
import Kingfisher

//클래스 싱클턴 패턴 vs 구조체 싱글턴 패턴
class ImageSearchAPIManager {
    
    private init() {}
    static let shared = ImageSearchAPIManager()
    
    typealias completionHandler = (String) -> Void
    
    func fetchImageData(query: String, completionHandler: @escaping completionHandler) {
        
        let text = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = EndPoint.imageSearchURL + "query=\(text)&display=1&start=1" // 한개만
        
        let header: HTTPHeaders = ["X-Naver-Client-Id": APIKey.NAVER_ID, "X-Naver-Client-Secret": APIKey.NAVER_SECRET]
        
        //헤더 활용
        AF.request(url, method: .get, headers: header).validate(statusCode: 200..<400).responseData(queue: .global()) { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                let item = json["items"][0]["link"].stringValue
                
                completionHandler(item) //뷰컨에서 뷰를 표현 동시에 여러 작업 하게 해줘라
                
            case .failure(let error):
                print(error)
            }
        
    }
    
}
}


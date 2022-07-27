//
//  RecommandCollectionViewController.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/07/20.
//

import UIKit
//라이브러리 사용하려면 Import
import Toast
import Kingfisher

/*
 TableView -> CollectionView
 Row -> Item
 heightForRowAt -> ??? FlowLayout(heightForItemAt이 없는 경우
*/
class RecommandCollectionViewController: UICollectionViewController {
    
    //1. 값 전달 - 데이터를 받을 공간(프로퍼티) 생성
    var movieData: Movie?
    // 따로 프로퍼티 생성하지 않고 하나의 구조체를 전달 받는 이유? 1. 수정시에 편하려고
    
    
    
    
    var imageURL = "https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20220708_123%2F1657272256389R34Q0_JPEG%2Fmovie_image.jpg"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //3. 값 전달 - 프로퍼티 값을 뷰에 표현
        title = movieData?.title
        
        //화면 뜨기전에 컬렉션뷰의 셀 크기 셀 사이 간격 등 설정
        let layout = UICollectionViewFlowLayout()
        //간격 8 공통적인 숫자는 상수에 넣는게 좋음 타입어노테이션 활용
        // 셀과 셀 사이의 간격
        let spacing : CGFloat = 8
        //디바이스 넓이 / 3
        let width = UIScreen.main.bounds.width / 3 - (spacing * 4)
        //셀이 가지고 있는 사이즈
        // 몇 개 넣고 싶은지에 따라 크기 달라짐
        layout.itemSize = CGSize(width: width , height: (width * 1.2))
        //수평? 수직?
        layout.scrollDirection = .vertical
        // 여백
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        // 셀 사이 간격 셀 마다마다 크기가 다르게 설정되어 있을수도 있어서 최소한 간격
        // 셀이 작아지면 간격이 넓어질 수 있기 때문에
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        //collectionView에서 layout 쓸거야 선언
        collectionView.collectionViewLayout = layout
        
    }
    
    //하나의 섹션에 셀 갯수 몇개?
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    //셀 디자인
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommandCollectionViewCell", for: indexPath) as? RecommandCollectionViewCell else {
            return UICollectionViewCell() // 그냥 비어있는 셀(거의 불리지 않기 때문에)
        }
        
        cell.recommandImage.backgroundColor = .orange
        
        let url = URL(string: imageURL)
        cell.recommandImage.kf.setImage(with: url)
        
        
        return cell
    }
    
    //height가 없는 이유 width도 필요하다 collectionView는
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        view.makeToast("\(indexPath.item)번째 셀을 선택했습니다", duration: 1, position: .center)
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
   
}

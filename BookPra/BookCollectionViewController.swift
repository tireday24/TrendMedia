//
//  BookCollectionViewController.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/07/20.
//

import UIKit

class BookCollectionViewController: UICollectionViewController {
    
    var bookList = MovieInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //화면 뜨기전에 컬렉션뷰의 셀 크기 셀 사이 간격 등 설정
        let layout = UICollectionViewFlowLayout()
        //간격 8 공통적인 숫자는 상수에 넣는게 좋음 타입어노테이션 활용
        // 셀과 셀 사이의 간격
        let spacing : CGFloat = 10
        //디바이스 넓이 / 3
        let width = UIScreen.main.bounds.width / 2 - (spacing * 3)
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
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookList.movie.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as! BookCollectionViewCell
        
        cell.bookBackgroundView.backgroundColor = .systemGray
        cell.bookBackgroundView.layer.cornerRadius = 10
        cell.bookBackgroundView.clipsToBounds = true
        cell.bookBackgroundView.layer.shadowColor = UIColor.black.cgColor
        cell.bookBackgroundView.layer.shadowOpacity = 0.7
        
        let data = bookList.movie[indexPath.row]
        cell.configureCell(data: data)
        
       
        
        return cell
        
    }
    
    
}

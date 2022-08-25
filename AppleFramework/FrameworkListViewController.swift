//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by 윤여진 on 2022/08/08.
//

import UIKit

class FrameworkListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let list: [AppleFramework] = AppleFramework.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // 컬렉션뷰 셀의 Estimate Size를 none으로 바꿔주기.
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
        
        // 셀의 여백 조절하는 것
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
        
    }
    
    
    
    
}

extension FrameworkListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCollectionViewCell", for: indexPath) as? FrameworkCollectionViewCell else { return UICollectionViewCell() }
        
        let framework = list[indexPath.item]
        cell.configure(framework)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = list[indexPath.item]
        
        //FrameWorkDetailViewController 띄우기
        let sb = UIStoryboard(name: "Detail", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "FrameWorkDetailViewController") as! FrameWorkDetailViewController
        
        self.present(vc, animated: true)
    }
    
    
}

extension FrameworkListViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //3열 일때
        let interItemSpacing: CGFloat = 10
        let padding: CGFloat = 16
        
        let width = (collectionView.bounds.width - interItemSpacing * 2 - padding * 2 ) / 3
        let height = width * 1.5
        
        return CGSize(width: width, height: height)
        
        //        //2열 일때
        //        let interItemSpacing: CGFloat = 10
        //        let padding: CGFloat = 16
        //
        //        let width = (collectionView.bounds.width - interItemSpacing * 1 - padding * 2 ) / 2
        //        let height = width * 1.5
        //
        //        return CGSize(width: width, height: height)
        //
        //        //4열 일때
        //        let interItemSpacing: CGFloat = 10
        //        let padding: CGFloat = 16
        //
        //        let width = (collectionView.bounds.width - interItemSpacing * 3 - padding * 2 ) / 4
        //        let height = width * 1.5
        //
        //        return CGSize(width: width, height: height)
    }
    // 셀의 행의 간격 (오른쪽 / 왼쪽)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    // 셀의 열의 간격 (위 / 아래)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

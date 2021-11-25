//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Bryan on 2021/11/25.
//

import UIKit

class FlowLayoutViewController: UIViewController {
    
    var collectionView :UICollectionView?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func setUpCollectionView (){
        
        //基本上加上UICollectionViewFlowLayout() 並且加入 UICollectionViewDelegateFlowLayout 差不多就完成了
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = view.bounds
        view.addSubview(collectionView)
        self.collectionView = collectionView
        
    }

}

extension FlowLayoutViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        cell.label.text = String(indexPath.row)
    return cell
    }
    
    
}

extension FlowLayoutViewController :UICollectionViewDelegateFlowLayout{
    
    //基本Cell大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2 - 5 , height:  view.frame.width / 2 )
    }
    
    
    //間距最小默認是10
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    
    //header footer 與 cell的距離
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets.init(top: 20, left: 20, bottom: 0, right: 0)
//    }
    
    
  
}


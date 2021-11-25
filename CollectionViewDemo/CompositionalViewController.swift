//
//  CompositionalViewController.swift
//  CollectionViewDemo
//
//  Created by Bryan on 2021/11/25.
//

import UIKit




class CompositionalViewController: UIViewController {
    
    var collectionView:UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
//        configCollectionView()
        configCollectionView2()

    }
    
    func configCollectionView(){
        
        //最基本版本
        let collectionViewLayout:UICollectionViewLayout = {
            
            let item = NSCollectionLayoutItem(layoutSize:
                                                NSCollectionLayoutSize(
                                                    widthDimension: .fractionalWidth(0.2),
                                                    heightDimension: .fractionalWidth(0.2)))
            item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
            
            //subItems 加入上面做好的item
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .absolute(120)),
                subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            //可讓group橫向滾動
            section.orthogonalScrollingBehavior = .continuous
            
            return UICollectionViewCompositionalLayout(section: section)
        
        }()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout:collectionViewLayout )
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = view.bounds
        view.addSubview(collectionView)
        self.collectionView = collectionView

    }
    
    
    
    func configCollectionView2(){
        
        //第一種layout
        let Layout1:NSCollectionLayoutSection = {
            
            let item = NSCollectionLayoutItem(layoutSize:
                                                NSCollectionLayoutSize(
                                                    widthDimension: .fractionalWidth(0.2),
                                                    heightDimension: .fractionalWidth(0.2)))
            item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
            
            //subItems 加入上面做好的item
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .absolute(120)),
                subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3)
            //可讓group橫向滾動
            section.orthogonalScrollingBehavior = .continuous
            
            return section
        
        }()
        
        //第二種layout
        let Layout2:NSCollectionLayoutSection = {
            
            let item = NSCollectionLayoutItem(layoutSize:
                                                NSCollectionLayoutSize(
                                                    widthDimension: .fractionalWidth(1),
                                                    heightDimension: .fractionalHeight(1)))
            item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
            
            //subItems 加入上面做好的item
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .absolute(220)),
                subitems: [item])
           
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3)
            //可讓group橫向滾動
            section.orthogonalScrollingBehavior = .continuous
            
            return section
        
        }()
        
        //第3種layout
        let Layout3:NSCollectionLayoutSection = {
            
            let item = NSCollectionLayoutItem(layoutSize:
                                                NSCollectionLayoutSize(
                                                    widthDimension: .fractionalWidth(0.5),
                                                    heightDimension: .fractionalWidth(0.2)))
            item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
            
            //subItems 加入上面做好的item
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .absolute(120)),
                subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3)
            //可讓group橫向滾動
            section.orthogonalScrollingBehavior = .continuous
            
            return section
        
        }()
        
        
        //為了要在不同的section用不同的呈現方式 所以得使用sectionLayoutProvider,裡面提供了可偵測Section index的 Clouser
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { index, _ in
            switch index {
            case 0:
                return Layout1
            case 1:
                return Layout2
            default:
                return Layout3
            }
        }))
        
        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout:collectionViewLayout )
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = view.bounds
        view.addSubview(collectionView)
        self.collectionView = collectionView

    }
}







extension CompositionalViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        6
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        cell.label.text = String(indexPath.row)
        return cell
    }
    
    
}

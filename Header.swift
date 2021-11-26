//
//  Header.swift
//  CollectionViewDemo
//
//  Created by Bryan on 2021/11/26.
//

import UIKit

class Header: UICollectionReusableView {
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        label.text =  "Categories"
        label.font = .systemFont(ofSize: 40, weight: .semibold)
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

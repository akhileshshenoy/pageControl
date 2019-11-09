//
//  menuCell.swift
//  HealthGate1.0
//
//  Created by student on 02/11/19.
//  Copyright © 2019 student. All rights reserved.
//
import UIKit

class MenuCell: UICollectionViewCell {
    
    let label: UILabel = {
        let l = UILabel()
        l.text = "Menu Item"
        l.font = UIFont.systemFont(ofSize: 15)
        l.textAlignment = .center
        l.textColor = .lightGray
        return l
    }()
    
    override var isSelected: Bool {
        didSet {
            label.textColor = isSelected ? .black : .lightGray
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        _ = label.anchor(safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

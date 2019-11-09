//
//  btCell.swift
//  HealthGate1.0
//
//  Created by student on 02/11/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class biometricTableViewCell: UITableViewCell
{

     @objc let title: UILabel = {
           let label = UILabel()
           //label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 18)
        label.backgroundColor = .white
           label.textColor = .black
           return label
       }()
    
    @objc let value: UITextField = {
        let value = UITextField(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 10.0))
        value.borderRect(forBounds: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 10.0))
        value.borderStyle = .roundedRect
        return value
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupTitle() {
  
        addSubview(title)
        _ = title.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 0)
        addSubview(value)
        _ = value.anchor(topAnchor, left: title.leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 100, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 0)
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}

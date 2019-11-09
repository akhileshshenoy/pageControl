//
//  mainCell.swift
//  HealthGate1.0
//
//  Created by student on 02/11/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class MainCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {
    
    var data = ["a"]
    var screenHeight: CGFloat = 400

    


    
    fileprivate let cellId = "cellId"
 
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = .init(top: 0, left: 0, bottom: 8, right: 0)
        tableView.register(biometricTableViewCell.self, forCellReuseIdentifier: cellId)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        _ = tableView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(data.count)
        if data.count == 0{
            return 1
        }else{
            return data.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! biometricTableViewCell
            cell.selectionStyle = .none
            cell.title.text = String(data[indexPath.row])
            
            print("\nc",data[indexPath.row])

        cell.value.placeholder = "Enter"
                cell.title.textColor = .black

            return cell
        }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped")
        if data.count == 0 {
            return
        }else{
            print("i",indexPath.row)
        }
    }
    
    
    func gradient(frame:CGRect, firstColor: UIColor, secondColor: UIColor) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.frame = frame
        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.colors = [
            firstColor.cgColor, secondColor.cgColor]
        return layer
    }
}


//
//  ViewController.swift
//  HealthGate1.0
//
//  Created by student on 03/10/19.
//  Copyright © 2019 student. All rights reserved.
//

//
//  ScheduleController.swift
//  Revels
//
//  Created by Naman Jain on 19/12/18.
//  Copyright © 2018 Naman Jain. All rights reserved.
//

import UIKit


class ScheduleController: UICollectionViewController, UICollectionViewDelegateFlowLayout, MenuControllerDelegate{
    var day1Array = ["Height","Weight","OPV1","OPV2"]
    var day2Array = ["Height","Weight","OPV1","OPV2","OPV1","OPV2","OPV1","OPV2","OPV1","OPV2"]
    var day3Array = ["Height","Weight","OPV1","OPV2"]
    var day4Array = ["Height","Weight","OPV1","OPV2"]
    

    
    var screenHeight : CGFloat = 400
    
    fileprivate let menuController = MenuController(collectionViewLayout: UICollectionViewFlowLayout())
    
    fileprivate let cellId = "cellId"
  fileprivate let cellId1 = "cellId1"
//    fileprivate let cellId2 = "cellId2"
//    fileprivate let cellId3 = "cellId3"
//    fileprivate let cellId4 = "cellId4"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuController.delegate = self
        menuController.collectionView.selectItem(at: [0, 0], animated: true, scrollPosition: .centeredHorizontally)
        
        self.collectionView.allowsSelection = false
        
        setupNavigationBar()
        setupLayout()
        setupCollectionView()

        calculateScreenHeight()
    }
    

    
    fileprivate func setupNavigationBar() {
        view.backgroundColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let titleLabel = UILabel()
        titleLabel.text = "Vaccines"
        titleLabel.textColor = .red
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.sizeToFit()
        let leftItem = UIBarButtonItem(customView: titleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
       {
           view.endEditing(true)
       }

    fileprivate func setupLayout() {
        let menuView = menuController.view!
        view.addSubview(menuView)
        _ = menuView.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)
        collectionView.backgroundColor = .white
        _ = collectionView.anchor(menuView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0 )
    }
    
    func didTapMenuItem(indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        print("\n x =",x)
        let offset = x / 4
        menuController.menuBar.transform = CGAffineTransform(translationX: offset, y: 0)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        let item = x / view.frame.width
        let indexPath = IndexPath(item: Int(item), section: 0)
        menuController.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
    
    func calculateScreenHeight(){
        if let tabBarHeight = self.tabBarController?.tabBar.frame.height{
            print(tabBarHeight)
            if let navBarHeight = self.navigationController?.navigationBar.intrinsicContentSize.height{
                print(navBarHeight)
                let guide = view.safeAreaLayoutGuide
                let height = guide.layoutFrame.size.height - ((view.window?.windowScene?.statusBarManager?.statusBarFrame.height)! + tabBarHeight + navBarHeight + 60)
                self.screenHeight = height
            }
        }
    }
    
    fileprivate func setupCollectionView() {
        
        collectionView.allowsSelection = true
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
        }
        
        //each day cell has been registered seperately to prevent reusage of cells which caused a very weird bug.
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(MainCell.self, forCellWithReuseIdentifier: cellId1)
//        collectionView.register(MainCell.self, forCellWithReuseIdentifier: cellId2)
//        collectionView.register(MainCell.self, forCellWithReuseIdentifier: cellId3)
//        collectionView.register(MainCell.self, forCellWithReuseIdentifier: cellId4)
        
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId1, for: indexPath) as! MainCell
        if indexPath.item == 0{
            //cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId1, for: indexPath) as! MainCell
            cell.data = day1Array
        }else if indexPath.item == 1{
            //cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId2, for: indexPath) as! MainCell
            cell.data = day2Array
        }else if indexPath.item == 2{
            //cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId3, for: indexPath) as! MainCell
            cell.data = day3Array
        }else if indexPath.item == 3{
            //cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId4, for: indexPath) as! MainCell
            cell.data = day4Array

        }else{
            //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId1, for: indexPath) as! MainCell
            cell.data = day4Array
        }
        //cell.screenHeight = screenHeight
        //cell.scheduleController = self
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let navBarHeight = self.navigationController?.navigationBar.intrinsicContentSize.height{
            return .init(width: view.frame.width, height: view.frame.height - 10 -  (view.window?.windowScene?.statusBarManager?.statusBarFrame.height)! - navBarHeight)
        }
        
        return .init(width: view.frame.width, height: view.frame.height - 40 - 10 - (view.window?.windowScene?.statusBarManager?.statusBarFrame.height)! )
    }
    

    

    

    
}


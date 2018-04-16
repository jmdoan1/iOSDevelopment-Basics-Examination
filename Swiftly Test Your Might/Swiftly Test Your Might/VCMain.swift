//
//  VCMain.swift
//  Swiftly Test Your Might
//
//  Created by Xavier Lian on 4/6/18.
//  Copyright © 2018 BinaryFuel. All rights reserved.
//

import UIKit

/// Hey, have fun!
class VCMain: UIViewController
{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate let edgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    let autoMobiles: [Automobile] = Gimme.the.collectionViewDataForSection0() //calling once here
    let reuseCellAuto = "reuseCellAuto"
    
    var collectionViewDataForSection1 = [Int]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Register the CVAUtomobile UITableViewCell nib and apply the reuse identifier
        collectionView.register(UINib(nibName: "CVAutomobile", bundle: nil), forCellWithReuseIdentifier: reuseCellAuto)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        _ = Gimme.the.collectionViewDataForSection1(onDone: { (result) in
            
            switch result {
            case .success(let values):
                self.collectionViewDataForSection1 = values
                self.collectionView.reloadSections([1])
            case .failure():
                print("JD: 'Gimme.the.collectionViewDataForSection1' FAILED")
            }
            
        })
    }
}

extension VCMain: UICollectionViewDataSource, UICollectionViewDelegate
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return autoMobiles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CVAutomobile = collectionView.dequeueReusableCell(withReuseIdentifier: reuseCellAuto,
                                                                    for: indexPath) as! CVAutomobile
        
        cell.populate(using: autoMobiles[indexPath.row])
        
        return cell
    }
}

extension VCMain: UICollectionViewDelegateFlowLayout
{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.collectionView.frame.width, height: CVAutomobile.intrinsicHeight())
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return edgeInsets
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
}

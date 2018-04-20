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
    
    // commenting out because I don't like to delete things immediately
    //fileprivate let edgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    let autoMobiles: [Automobile] = Gimme.the.collectionViewDataForSection0() //calling once here
    let reuseCellAuto = "reuseCellAuto"
    
    var collectionViewDataForSection1 = [Int]()
    let reuseCellSection1 = "reuseCellSection1"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //Register the CVAUtomobile UITableViewCell nib and apply the reuse identifier
        collectionView.register(UINib(nibName: "CVAutomobile", bundle: nil), forCellWithReuseIdentifier: reuseCellAuto)
        
        //Register the CVNumber UICollectionViewCell nib and apply the reuse identifier
        collectionView.register(UINib(nibName: "CVNumber", bundle: nil), forCellWithReuseIdentifier: reuseCellSection1)
        
        getSection1Data()
    }
    
    func getSection1Data()
    {
        _ = Gimme.the.collectionViewDataForSection1(onDone: { (result) in
            
            switch result {
            case .success(let values):
                self.collectionViewDataForSection1 = values
            case .failure():
                self.collectionViewDataForSection1.removeAll()
                print("JD: 'Gimme.the.collectionViewDataForSection1' FAILED")
            }
            
            //reload just the relevant section for this data
            self.collectionView.reloadSections([1])
            
        })
    }
    
    @objc func presentModally(sender: UIButton) {
        let tag = sender.tag
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "VCTireModal") as? VCTireModal {
            vc.automobile = autoMobiles[tag]
            self.present(vc, animated: true, completion: nil)
        }
    }
}

extension VCMain: UICollectionViewDataSource, UICollectionViewDelegate
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return autoMobiles.count
        case 1:
            return collectionViewDataForSection1.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        let row = indexPath.row
        
        if section == 0 {
            let cell: CVAutomobile = collectionView.dequeueReusableCell(withReuseIdentifier: reuseCellAuto, for: indexPath) as! CVAutomobile
            
            cell.populate(using: autoMobiles[row])
            
            // Adding a tag to the cell's modal button that can later be pulled to determine which cell is being tapped
            cell.modalBt.tag = row
            cell.modalBt.addTarget(self, action: #selector(VCMain.presentModally(sender:)), for: .touchUpInside)
            
            return cell
        } else {
            let cell: CVNumber = collectionView.dequeueReusableCell(withReuseIdentifier: reuseCellSection1, for: indexPath) as! CVNumber
            
            cell.set(number: collectionViewDataForSection1[row])
            
            return cell
        }
        
    }
}

extension VCMain: UICollectionViewDelegateFlowLayout
{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        case 0:
            return CGSize(width: self.collectionView.frame.width, height: CVAutomobile.intrinsicHeight())
        default:
            return CGSize(width: (self.collectionView.frame.width - 6) / 3, height: 50) //to allow 3 across with 2 spaces
        }
    }
    
    /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return edgeInsets
    }
    */
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
 
}

//
//  CVAutomobile.swift
//  Swiftly Test Your Might
//
//  Created by Xavier Lian on 4/8/18.
//  Copyright © 2018 BinaryFuel. All rights reserved.
//

import UIKit

class CVAutomobile: UICollectionViewCell
{
    //MARK:- Properties
    
    var automobile: Automobile?
    @IBOutlet var pushBt: UIButton!
    @IBOutlet var modalBt: UIButton!
    @IBOutlet var makeLbl: UILabel!
    @IBOutlet var modelLbl: UILabel!
    
    //MARK:- Functions
    
    func populate(using auto: Automobile)
    {
        automobile = auto
        makeLbl.text = auto.make
        modelLbl.text = auto.model
    }
    
    static func intrinsicHeight() -> CGFloat {
        //Calling the height from the overridden intrinsicContentSize from below
        return CVAutomobile().intrinsicContentSize.height
    }
    
    @IBAction func push(_ sender: Any) {
    }
    
    
    //MARK:- UI Business
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 0, height: 150)
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        modalBt.backgroundColor = .purple
        pushBt.backgroundColor = .brown
    }
}

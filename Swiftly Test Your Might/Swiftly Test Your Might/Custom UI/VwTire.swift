//
//  VwTire.swift
//  Swiftly Test Your Might
//
//  Created by Xavier Lian on 4/6/18.
//  Copyright © 2018 BinaryFuel. All rights reserved.
//

import UIKit

class VwTire: NibView
{
    //MARK:- Properties
    
    @IBOutlet var tire1Vw: UIView!
    @IBOutlet var tire2Vw: UIView!
    @IBOutlet var tire3Vw: UIView!
    @IBOutlet var tire4Vw: UIView!
    @IBOutlet var lbl1: UILabel!
    @IBOutlet var lbl2: UILabel!
    @IBOutlet var lbl3: UILabel!
    @IBOutlet var lbl4: UILabel!
    @IBOutlet var makeModelLbl: UILabel!
    
    //MARK:- Functions
    
    func populate(using auto: Automobile)
    {
        print(auto.wheels)
        makeModelLbl.text = "Tires for:\n\(auto.make)\n\(auto.model)"
        for x in 0 ..< lbls.count
        {
            if auto.wheels.count > x {
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd MMM yyyy" //dd = 2 day numbers even when under 10, MMM = 3 character short code for month, yyyy = full four digit year
                
                //apply previously set format to date and set label text
                lbls[x].text = dateFormatter.string(from: auto.wheels[x].dateChanged)
                
                if auto.wheels[x].punctured {
                    vws[x].backgroundColor = UIColor.red
                }
            }
        }
    }
    
    //MARK:- Private Properties
    
    private var lbls = [UILabel]()
    private var vws = [UIView]()
    
    //MARK:- UI Business
    
    override func setup()
    {
        super.setup()
        
        lbls.append(lbl1)
        lbls.append(lbl2)
        lbls.append(lbl3)
        lbls.append(lbl4)
        
        vws.append(tire1Vw)
        vws.append(tire2Vw)
        vws.append(tire3Vw)
        vws.append(tire4Vw)
    }
}

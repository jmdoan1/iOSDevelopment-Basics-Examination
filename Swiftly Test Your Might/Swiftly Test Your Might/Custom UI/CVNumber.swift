//
//  CVNumber.swift
//  Swiftly Test Your Might
//
//  Created by Justin Doan on 4/16/18.
//  Copyright © 2018 BinaryFuel. All rights reserved.
//

import UIKit

class CVNumber: UICollectionViewCell
{
    
    //MARK:- Properties
    @IBOutlet weak var numberLbl: UILabel!
    
    var cellNumber: Int? {
        willSet {
            if let nv = newValue {
                numberLbl.text = "\(nv)"
            } else {
                numberLbl.text = ""
            }
        }
    }
    
    func set(number: Int) {
        cellNumber = number
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        numberLbl.text = ""
    }
}

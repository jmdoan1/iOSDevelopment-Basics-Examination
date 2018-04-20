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
                numberLbl.text = nv.description
                setBackgroundColor(withNumber: nv)
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
        
        if let cn = cellNumber {
            numberLbl.text = cn.description
        } else {
            numberLbl.text = ""
        }
        
    }
    
    private func setBackgroundColor(withNumber: Int) {
        if withNumber % 23 == 0 {
            self.backgroundColor = UIColor.orange
        } else if withNumber % 2 == 0 {
            self.backgroundColor = UIColor.green
        } else {
            self.backgroundColor = UIColor.red
        }
    }
}

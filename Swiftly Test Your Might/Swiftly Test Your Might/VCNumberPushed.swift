//
//  VCNumberPushed.swift
//  Swiftly Test Your Might
//
//  Created by Xavier Lian on 4/9/18.
//  Copyright © 2018 BinaryFuel. All rights reserved.
//

import UIKit

class VCNumberPushed: UIViewController
{
    //MARK:- Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Gimme.the.loadingSequenceFor(thePushedVC: self)
    }
    
    @IBOutlet var numberLbl: UILabel!
}

extension VCNumberPushed: SouperKoolDelegate {
    func souperDidGive(new number: Int) {
        DispatchQueue.main.async {
            self.numberLbl.text = number.description
        }
    }
}

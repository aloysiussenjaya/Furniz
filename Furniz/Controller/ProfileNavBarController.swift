//
//  ProfileNavBarController.swift
//  Furniz
//
//  Created by Aloysius Shendy on 03/09/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import UIKit

class ProfileNavBarController: UINavigationController {

    @IBOutlet weak var profileNavBarView: UINavigationBar!
    
    override func viewDidLoad() {
        profileNavBarView.layer.cornerRadius = 40
        profileNavBarView.clipsToBounds = true
        profileNavBarView.backgroundColor = UIColor.white
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

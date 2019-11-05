//
//  NavBarController.swift
//  Furniz
//
//  Created by Aloysius Shendy on 03/09/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import UIKit

class NavBarController: UINavigationController {

    @IBOutlet weak var navBarView: UINavigationBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarView?.layer.cornerRadius = 40
        navBarView?.clipsToBounds = true
        navBarView?.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

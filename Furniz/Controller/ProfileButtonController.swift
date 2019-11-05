//
//  ProfileButtonController.swift
//  Furniz
//
//  Created by Aloysius Shendy on 03/09/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import UIKit

class ProfileButtonController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var baseViewProfile: UIView!
    
    let profileCellItems = ["Green Faux Sofa","Yellow Fabric Sofa"]
    let profileCellItemsImage = ["green_sofa.jpg","yellow_sofa.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseViewProfile.layer.cornerRadius = 40
        baseViewProfile.clipsToBounds = true
        baseViewProfile.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    
    func collectionView( _ collectionView: UICollectionView, numberOfItemsInSection section: Int)-> Int{
        return profileCellItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let profilecell = collectionView.dequeueReusableCell(withReuseIdentifier: "profileCell", for: indexPath) as! ProfileCollectionViewCell
        
        profilecell.profileLabelCell.text = profileCellItems[indexPath.item]
        
        return profilecell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        performSegue(withIdentifier: "profileCell", sender: nil)
    }
    
//    func collectionView( _ collectionView: UICollectionView, numberOfItemsInSection section: Int )-> Int {
//        return profileCellItems.count
//    }
//
//    func collectionView( _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
//        let profilecell = collectionView.dequeueReusableCell(withReuseIdentifier: "profileCell", for: indexPath) as! ProfileCollectionViewCell
//
//        profilecell.profileLabelCell.text = profileCellItems[indexPath.item]
////        profilecell.profileImageCell.image = UIImage(named: profileCellItemsImage[indexPath.item])
////
//        return profilecell
//    }
//
//    func collectionView( _ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
//        performSegue(withIdentifier: "profileCell", sender: nil)
//    }
//

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

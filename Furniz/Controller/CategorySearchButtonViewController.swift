//
//  CategorySearchButtonViewController.swift
//  Furniz
//
//  Created by Aloysius Shendy on 03/09/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import UIKit

class CategorySearchButtonViewController: UIViewController {

    @IBOutlet weak var categoryView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryView.layer.cornerRadius = 40
        categoryView.clipsToBounds = true
        categoryView.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    
    let categoryCellItems = ["Green Faux Sofa","Yellow Fabric Sofa"]
    let categoryCellItemsImage = ["green_sofa.jpg","yellow_sofa.jpg"]
        // Do any additional setup after loading the view.
    
    func collectionView( _ collectionView: UICollectionView, numberOfItemsInSection section: Int)-> Int{
        return categoryCellItems.count
    }
    
    func collectionView( _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)-> UICollectionViewCell{
        let categorycell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCollectionViewCell
        
        categorycell.categoryCellLabel.text = categoryCellItems[indexPath.item]
        
        return categorycell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        performSegue(withIdentifier: "categoryCell", sender: nil)
    }
    


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
 
    */
}


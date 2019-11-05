//
//  SearchButtonController.swift
//  Furniz
//
//  Created by Aloysius Shendy on 02/09/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import UIKit

class SearchButtonController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var baseView: UIView?
    
    let searchCellItems = ["Sofas","Tables","Dining Tables","Cabinets","Lamp"]
    let searchCellItemsImage = ["sofa.jpg","table.jpg","dining_table.jpg","cabinet.jpg","chair.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView?.layer.cornerRadius = 40
        baseView?.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
    func collectionView( _ collectionView: UICollectionView, numberOfItemsInSection section: Int )-> Int {
        return searchCellItems.count
    }
    
    func collectionView( _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SearchCollectionViewCell
        
        cell.searchCellLabel.text = searchCellItems[indexPath.item]
        cell.searchCellImage.image = UIImage(named: searchCellItemsImage[indexPath.item])
        
        return cell
    }
    
    func collectionView( _ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        performSegue(withIdentifier: "Cell", sender: nil)
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

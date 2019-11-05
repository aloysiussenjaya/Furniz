//
//  ViewController.swift
//  Furniz
//
//  Created by Aloysius Shendy on 02/09/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class HomePageController: UIViewController, ARSCNViewDelegate {
    
    
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var wallSwitch: UISwitch!
    @IBOutlet weak var setButton: UIButton!
    @IBOutlet weak var panjangField: UITextField!
    @IBOutlet weak var lebarField: UITextField!
    
    let configuration = ARWorldTrackingConfiguration()
    
    var furnitureList = [
        object3D(sofa: "sofa1", table: "table1", floor: "floor1", dining: "dining1", cabinet: "cabinet1", lamp: "lamp1",wall: "wall1")
    ]
    
    var lebar: Int = 1
    var panjang: Int = 1
    
    let markerImage = ARReferenceImage.referenceImages(inGroupNamed: "Marker", bundle: Bundle.main)
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    ////////////////
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var magazineButton: UIButton!
    @IBOutlet weak var exitButtonView: UIButton!
    
    @IBOutlet weak var profileButtonView: UIView!
    @IBOutlet weak var searchButtonView: UIView!
    @IBOutlet weak var magazineButtonView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchButtonView.isHidden = true
        profileButtonView.isHidden = true
        magazineButtonView.isHidden = true
        
        
        sceneView.delegate = self
        panjangField.keyboardType = .numberPad
        lebarField.keyboardType = .numberPad
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        configuration.isLightEstimationEnabled = true
        configuration.planeDetection = .horizontal
        configuration.detectionImages = markerImage
        configuration.maximumNumberOfTrackedImages = 10
        
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: furnitureList[0].floor + ".jpg")
        let scaleX = (Float(lebar)  / 0.2).rounded()
        let scaleY = (Float(panjang) / 0.2).rounded()
        material.diffuse.contentsTransform = SCNMatrix4MakeScale(scaleX, scaleY, 0)
        material.diffuse.wrapS = .repeat
        material.diffuse.wrapT = .repeat
        
        let mWall = SCNMaterial()
        mWall.diffuse.contents = UIImage(named: furnitureList[0].wall)
        
        if let imageAnchor = anchor as? ARAnchor{
            if (imageAnchor.name) == "floorM" {
                
                let floor = SCNPlane(width: CGFloat(lebar),height: CGFloat(panjang))
                floor.materials = [material]
                let floorNode = SCNNode(geometry: floor)
                floorNode.eulerAngles.x = -.pi / 2
                node.addChildNode(floorNode)
                
                if wallSwitch.isOn == true {
                    
                    let wall = SCNPlane(width: CGFloat(lebar),height: CGFloat(panjang))
                    wall.materials = [mWall]
                    
                    let wallNode = SCNNode(geometry: wall)
                    wallNode.position.z = Float(panjang) / 2 * (-1)
                    wallNode.position.y = Float(lebar) / 2
                    node.addChildNode(wallNode)
                    
                    let wall2Node = SCNNode(geometry: wall)
                    wall2Node.position.z = Float(panjang) / 2
                    wall2Node.eulerAngles.x = .pi
                    wall2Node.position.y = Float(lebar) / 2
                    node.addChildNode(wall2Node)
                    
                    let wall3Node = SCNNode(geometry: wall)
                    wall3Node.position.x = Float(lebar) / 2
                    wall3Node.eulerAngles.y = -.pi / 2
                    wall3Node.position.y = Float(lebar) / 2
                    node.addChildNode(wall3Node)
                    
                    let wall4Node = SCNNode(geometry: wall)
                    wall4Node.position.x = Float(lebar) / 2 * (-1)
                    wall4Node.eulerAngles.y = .pi / 2
                    wall4Node.position.y = Float(lebar) / 2
                    node.addChildNode(wall4Node)
                }
                
                
            }
                
            else if imageAnchor.name == "sofaM"{
                
                let sofaScene = SCNScene(named: "art.scnassets/" + furnitureList[0].sofa + "/" + furnitureList[0].sofa + ".scn")!
                let sofaNode = sofaScene.rootNode.childNodes.first!
                sofaNode.position.y = 0.25
                node.addChildNode(sofaNode)
            }
                
            else if imageAnchor.name == "tableM"{
                
                let tableScene = SCNScene(named: "art.scnassets/" + furnitureList[0].table + "/" + furnitureList[0].table + ".scn")!
                let tableNode = tableScene.rootNode.childNodes.first!
                tableNode.position.y = 0.25
                node.addChildNode(tableNode)
            }
                
            else if imageAnchor.name == "diningM"{
                
                let diningScene = SCNScene(named: "art.scnassets/" + furnitureList[0].dining + "/" + furnitureList[0].dining + ".scn")!
                let diningNode = diningScene.rootNode.childNodes.first!
                diningNode.position.y = 0.25
                node.addChildNode(diningNode)
                
            }
                
            else if imageAnchor.name == "cabinetM"{
                
                let cabinetScene = SCNScene(named: "art.scnassets/" + furnitureList[0].cabinet + "/" + furnitureList[0].cabinet + ".scn")!
                let cabinetNode = cabinetScene.rootNode.childNodes.first!
                cabinetNode.position.y = 0.25
                node.addChildNode(cabinetNode)
            }
                
            else if imageAnchor.name == "lampM"{
                
                let lampScene = SCNScene(named: "art.scnassets/" + furnitureList[0].lamp + "/" + furnitureList[0].lamp + ".scn")!
                let lampNode = lampScene.rootNode.childNodes.first!
                lampNode.position.y = 0.25
                node.addChildNode(lampNode)
            }
            
        }
        
        return node
    }

    
    @IBAction func setButtonHandle(_ sender: UIButton) {
        panjang = Int(panjangField.text ?? "") ?? 0
        lebar = Int(lebarField.text ?? "") ?? 0
        print(panjang)
        print(lebar)
        sceneView.scene.rootNode.enumerateChildNodes { (node, stop) in
            node.removeFromParentNode()
        }
        configuration.isLightEstimationEnabled = true
        configuration.planeDetection = .horizontal
        configuration.detectionImages = markerImage
        configuration.maximumNumberOfTrackedImages = 10
        sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
        
        view.endEditing(true)
    }
    /////////////////////////////////////////////////////////////////////////////////////
    
    @IBAction func showSearchButtonView(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.searchButtonView.isHidden = false
        }, completion: nil)
        
    }
    
    @IBAction func showProfileButtonView(_ sender: UIButton) {
        profileButtonView.layer.cornerRadius = 40
        profileButtonView.clipsToBounds = true
        profileButtonView.backgroundColor = UIColor.white
        profileButtonView.isHidden = false
    }
    
    @IBAction func showMagazineButtonView(_ sender: UIButton) {
        magazineButtonView.layer.cornerRadius = 40
        magazineButtonView.clipsToBounds = true
        profileButtonView.backgroundColor = UIColor.white
        magazineButtonView.isHidden = false
    }
    
    
    @IBAction func exitAllView(_ sender: UIButton) {
        searchButtonView.isHidden = true
        profileButtonView.isHidden = true
        magazineButtonView.isHidden = true
    }
    
    
    
    
    

}


//
//  SpaceViewController.swift
//  UFOGame
//
//  Created by Evan Grossman on 4/6/16.
//  Copyright © 2016 Evan Grossman. All rights reserved.
//

import UIKit
import SceneKit

class SpaceViewController: UIViewController {

    var scnView: SCNView!
    var spaceScene: SCNScene!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.redColor()
        setupScenes()
    }
    
    func setupScenes() {
        scnView = SCNView(frame: self.view.frame)
        self.view.addSubview(scnView)
        spaceScene = SCNScene(named: "/UFOGame.scnassets/Space.scn")
        scnView.scene = spaceScene
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



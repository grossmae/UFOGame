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
    
    var ufoNode: SCNNode!
    var planetNode: SCNNode!
    var currentPlanetXAngle: Float = 0.0
    var currentPlanetZAngle: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.redColor()
        setupScenes()
        setupNodes()
        setupGestures()
    }
    
    func setupScenes() {
        scnView = SCNView(frame: self.view.frame)
        self.view.addSubview(scnView)
        spaceScene = SCNScene(named: "/UFOGame.scnassets/Space.scn")
        scnView.scene = spaceScene
    }
    
    func setupNodes() {
        ufoNode = spaceScene.rootNode.childNodeWithName("UFO", recursively: true)!
        planetNode = spaceScene.rootNode.childNodeWithName("Earth", recursively: true)!
    }
    
    func setupGestures() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        scnView.addGestureRecognizer(panGestureRecognizer)
    }

    func handlePanGesture(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(sender.view!)
        
        var newZAngle = (Float)(-translation.x)*(Float)(M_PI)/360.0
        newZAngle += currentPlanetZAngle
        var newXAngle = (Float)(translation.y)*(Float)(M_PI)/360.0
        newXAngle += currentPlanetXAngle
        
        let zRotation = SCNMatrix4MakeRotation(newZAngle, 0, 0, 1)
        let xRotation = SCNMatrix4MakeRotation(newXAngle, 1, 0, 0)
        planetNode.transform = SCNMatrix4Mult(zRotation, xRotation)
        
        if(sender.state == UIGestureRecognizerState.Ended) {
            currentPlanetXAngle = newXAngle
            currentPlanetZAngle = newZAngle
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



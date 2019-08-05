//
//  Insert3D.swift
//
//  License: GPL
//  Copyright © 2019 Viktor Makarskyy. All rights reserved.
//

import Foundation
import SceneKit
import ModelIO
import SceneKit.ModelIO

extension ViewController {
    func Insert3D(width: Int, height : Int, x: Int, y: Int) {
        
        // Load the model file
        guard let url = Bundle.main.url(forAuxiliaryExecutable: modelMesh) else {
            fatalError("Failed to find model file.")
        }
        
        let asset = MDLAsset(url:url)
        guard let object = asset.object(at: 0) as? MDLMesh else {
            fatalError("Failed to get mesh from asset.")
        }
        print("Model Loaded!")
        
        // Create a material from the texture
        let scatteringFunction = MDLScatteringFunction()
        let material = MDLMaterial(name: "baseMaterial", scatteringFunction: scatteringFunction)
        
        let meshUrl = Bundle.main.url(forResource: modelMaterial, withExtension: "")
        material.setProperty(MDLMaterialProperty(name: modelMaterial, semantic: .baseColor, url: meshUrl))
        
        // Apply the texture to every submesh of the asset
        for  submesh in object.submeshes!  {
            if let submesh = submesh as? MDLSubmesh {
                submesh.material = material
                print("Material loaded!")
            }
        }
        
        let scene = SCNScene()
        //let scene = SCNScene(mdlAsset: asset)
        
        //let scnView = SCNView(frame: CGRect(x: (viewerPositionX), y: (viewerPositionY) , width: (viewerWidth) , height: (viewerHeight)))
        let scnView = SCNView(frame: CGRect(x: x, y: y , width: width , height: height))
        self.view.addSubview(scnView)
        scnView.scene = scene
        
        // Wrap the ModelIO object in a SceneKit object
        let node = SCNNode(mdlObject: object)
        scene.rootNode.addChildNode(node)
        
        node.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 7
        )))
        
        //set up scene
        scnView.autoenablesDefaultLighting = false
        scnView.allowsCameraControl = true
        scnView.scene = scene
        //scene.background.contents = viewerBackground
        scene.background.contents = UIColor.white
        }
}

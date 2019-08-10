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

public struct Insert3DViewer {
    public var width: Int
    public var height: Int
    public var x: Int
    public var y: Int
    public var background: NSObject
    public init() {
        width = 200;
        height = 200;
        x = 0;
        y = 0;
        background = UIColor.white;
    }
}

public struct Insert3DModel {
    public var mesh: String
    public var material: String
    public var autoRotate: Bool
    public var rotationSpeed: TimeInterval
    public var fixed: Bool
    public init() {
        mesh = "";
        material = "";
        autoRotate = true;
        fixed = false;
        rotationSpeed = 7;
    }
}


extension UIView {
    
    public func Insert3D(viewerSetup: Insert3DViewer, modelSetup: Insert3DModel) {
        
        let scene = SCNScene()
        
        guard let url = Bundle.main.url(forAuxiliaryExecutable: modelSetup.mesh) else {
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
        
        let meshUrl = Bundle.main.url(forResource: modelSetup.material, withExtension: "")
        material.setProperty(MDLMaterialProperty(name: modelSetup.material, semantic: .baseColor, url: meshUrl))
        
        // Apply the texture to every submesh of the asset
        for  submesh in object.submeshes!  {
            if let submesh = submesh as? MDLSubmesh {
                submesh.material = material
                print("Material loaded!")
            }
        }
        
        // Wrap the ModelIO object in a SceneKit object
        let modelNode = SCNNode(mdlObject: object)
        scene.rootNode.addChildNode(modelNode)
        
        if modelSetup.autoRotate == true {
            modelNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: modelSetup.rotationSpeed
            )))
        }
        
        let scnView = SCNView(frame: CGRect(x: viewerSetup.x, y: viewerSetup.y, width: viewerSetup.width, height: viewerSetup.height))
        //self.view.addSubview(scnView)
        self.addSubview(scnView)
        scnView.scene = scene
        
        //set up scene
        scnView.autoenablesDefaultLighting = false
        scnView.allowsCameraControl = !modelSetup.fixed
        scnView.scene = scene
        //scnView.backgroundColor = UIColor.clear
        scene.background.contents = viewerSetup.background
        
    }
}





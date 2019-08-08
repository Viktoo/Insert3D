//
//  ViewController.swift
//
//  License: GPL
//  Copyright © 2019 Viktor Makarskyy. All rights reserved.
//

import UIKit
//import Insert3Ddev

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewer = Insert3DViewer()
        viewer.width = 380
        viewer.height = 380
        
        let model = Insert3DModel()
        model.mesh = "model/Nachos.obj"
        model.material = "model/NachosMaterial.jpg"
        
        view.Insert3D(viewerSetup: viewer, modelSetup: model)
        
        //view.Insert3D(viewerSetup: Insert3DViewer.init(), modelSetup: Insert3DModel.init())
    }
}


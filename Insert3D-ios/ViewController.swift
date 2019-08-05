//
//  ViewController.swift
//
//  License: GPL
//  Copyright © 2019 Viktor Makarskyy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let modelMesh = "model/Nachos.obj"
    let modelMaterial = "model/NachosMaterial.jpg"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Insert3D(width: 380, height: 380, x: 0, y: 0)
    }
}


//
//  ViewController.swift
//  Project
//
//  Created by Logic on 2019/11/12.
//  Copyright © 2019 Galanz. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "商城"
    }
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.pushViewController(ViewController2(), animated: true)
    }
}


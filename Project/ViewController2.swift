//
//  ViewController2.swift
//  Project
//
//  Created by Logic on 2019/11/13.
//  Copyright © 2019 Galanz. All rights reserved.
//

import UIKit
import LoginServiceInterface

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "二级页"
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = KLServer.shared().login(with: nil)
        let nc = NavigationController(rootViewController: vc!)
        self.present(nc, animated: true, completion: nil)
    }
    
}

//
//  HomeViewController.swift
//  Project
//
//  Created by Kalan on 2020/9/16.
//  Copyright © 2020 Galanz. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "No.\(arc4random_uniform(100))"
        view.backgroundColor = .white
        
        let back = UIButton(type: .custom)
        back.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 30)
        back.setTitle("toViewController", for: .normal)
        back.setTitleColor(.purple, for: .normal)
        back.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 60)
        back.center = view.center
        back.addTarget(self, action: #selector(toViewController), for: .touchUpInside)
        view.addSubview(back)
    }

    @objc func toViewController() {
        navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    
}

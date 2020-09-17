//
//  NavigationController.swift
//  Project
//
//  Created by Kalan on 2020/9/16.
//  Copyright © 2020 Galanz. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    /// 统一处理二级页面隐藏TabBar的逻辑
    override public func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .done, target: self, action: #selector(backViewController))
            viewController.navigationItem.leftBarButtonItem?.imageInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 5)
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc func backViewController(animated: Bool) {
        self.popViewController(animated: true)
    }

}

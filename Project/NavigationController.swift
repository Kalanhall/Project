//
//  NavigationController.swift
//  Project
//
//  Created by Logic on 2019/11/13.
//  Copyright © 2019 Galanz. All rights reserved.
//

import UIKit
import HBDNavigationBar

class NavigationController: HBDNavigationController {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    /// 方法重载，否则外部无法访问
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    /// 指定构造器，初始化一个导航控制器
    ///
    /// 具体使用示例如下
    ///
    ///     NavigationController(rootViewController: ViewController(), title: "标题", image: "默认图名称", selectedImage: "选中图名称")
    ///
    /// - Parameter rootViewController: 导航栏根控制器
    /// - Parameter title: 选项卡标题
    /// - Parameter image: 选项卡默认图标
    /// - Parameter selectedImage: 选项卡选中图标
    ///
    /// - Returns: 返回自身
    init(rootViewController: UIViewController, title: String, image: String, selectedImage: String) {
        super.init(rootViewController: rootViewController)
        self.tabBarItem = UITabBarItem(title: title, image: UIImage(named: image)?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = true
        super.pushViewController(viewController, animated: animated)
    }
}

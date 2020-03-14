//
//  NavigationController.swift
//  Project
//
//  Created by Logic on 2019/11/13.
//  Copyright © 2019 Galanz. All rights reserved.
//

import UIKit
import KLNavigationController

extension KLNavigationController {
    
    /// 用于创建想选卡实例的分类方法
    ///
    /// 具体使用示例如下
    ///
    ///     KLNavigationController.navigation(rootViewController: ViewController(), title: "标题", image: "默认图名称", selectedImage: "选中图名称")
    ///
    /// - Parameter rootViewController: 导航栏根控制器
    /// - Parameter title: 选项卡标题
    /// - Parameter image: 选项卡默认图标
    /// - Parameter selectedImage: 选项卡选中图标
    ///
    /// - Returns: KLNavigationController实例
    public class func navigation(rootViewController: UIViewController, title: String, image: String, selectedImage: String) -> KLNavigationController {
        rootViewController.navigationItem.title = title
        let nc = KLNavigationController(rootViewController: rootViewController)
        nc.tabBarItem = UITabBarItem(title: title, image: UIImage(named: image)?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal))
        return nc
    }
    
    /// 统一处理二级页面隐藏TabBar的逻辑，KLNavigationController中没有重写该方法不影响其本身逻辑
    ///
    /// 具体使用示例如下
    ///
    ///     viewController.hidesBottomBarWhenPushed = true
    ///
    /// - Parameter viewController: 二级及控制器
    /// - Parameter animated: 选择是否动画的参数
    ///
    /// - Returns: KLNavigationController实例
    override public func pushViewController(_ viewController: UIViewController, animated: Bool) {
        // 统一设置底部栏隐藏状态
        viewController.hidesBottomBarWhenPushed = true
        // 统一设置返回按钮样式
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .done, target: self, action: #selector(backViewController))
        viewController.navigationItem.leftBarButtonItem?.imageInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc func backViewController(animated: Bool) {
        self.popViewController(animated: true)
    }
}

//
//  TabBarController.swift
//  Project
//
//  Created by Logic on 2019/11/13.
//  Copyright © 2019 Galanz. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        // MARK: 选项卡控制器添加
        addChild(NavigationController(rootViewController: ViewController(), title: "商城", image: "Tab0", selectedImage: "Tab0-h"))
        addChild(NavigationController(rootViewController: ViewController(), title: "视频", image: "Tab1", selectedImage: "Tab1-h"))
        addChild(NavigationController(rootViewController: ViewController(), title: "购物", image: "Tab2", selectedImage: "Tab2-h"))
        addChild(NavigationController(rootViewController: ViewController(), title: "我的", image: "Tab3", selectedImage: "Tab3-h"))
        
        // MARK: 适配iOS13选项卡色值
        if #available(iOS 13.0, *) {
            let appearance = self.tabBar.standardAppearance.copy()
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.lightGray]
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor : UIColor.black]
            appearance.stackedLayoutAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
            appearance.stackedLayoutAppearance.selected.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
            self.tabBar.standardAppearance = appearance
        } else {
            for item in self.viewControllers ?? [] {
                item.tabBarItem.setTitleTextAttributes([.foregroundColor : UIColor.lightGray], for: .normal)
                item.tabBarItem.setTitleTextAttributes([.foregroundColor : UIColor.black], for: .selected)
                item.tabBarItem.imageInsets = UIEdgeInsets(top: -4, left: 0, bottom: 4, right: 0)
                item.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
            }
        }
        
        // MARK: 导航栏主体设置
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().barTintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor.black]
        
        // MARK: 导航栏返回按钮文字、图片处理
        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "back")
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "back")
        UIBarButtonItem.appearance().setTitleTextAttributes([.foregroundColor : UIColor.clear], for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([.foregroundColor : UIColor.clear], for: .highlighted)
        
    }

}

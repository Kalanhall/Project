//
//  TabBarController.swift
//  Project
//
//  Created by Logic on 2019/11/13.
//  Copyright © 2019 Galanz. All rights reserved.
//

import UIKit
import KLNavigationController

extension UITabBarController {

    /// 配置选项卡入口及主题
    func setupItems() -> UITabBarController {
        self.view.backgroundColor = UIColor.white
        
        // MARK: 选项卡控制器添加
        addChild(KLNavigationController.navigation(rootViewController: ViewController(), title: "商城", image: "Tab0", selectedImage: "Tab0-h"))
        addChild(KLNavigationController.navigation(rootViewController: ViewController(), title: "视频", image: "Tab1", selectedImage: "Tab1-h"))
        addChild(KLNavigationController.navigation(rootViewController: ViewController(), title: "购物", image: "Tab2", selectedImage: "Tab2-h"))
        addChild(KLNavigationController.navigation(rootViewController: ViewController(), title: "我的", image: "Tab3", selectedImage: "Tab3-h"))
        
        // MARK: 适配iOS13以下选项卡
        for item in self.viewControllers ?? [] {
            item.tabBarItem.setTitleTextAttributes([.foregroundColor : UIColor.lightGray], for: .normal)
            item.tabBarItem.setTitleTextAttributes([.foregroundColor : UIColor.black], for: .selected)
            item.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)     // iOS13以上无效
            item.tabBarItem.imageInsets = UIEdgeInsets(top: -4, left: 0, bottom: 4, right: 0)   // 对现有版本都适用
        }
        // MARK: 适配iOS13选项卡
        if #available(iOS 13.0, *) {
            let appearance = self.tabBar.standardAppearance.copy()
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.lightGray]
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor : UIColor.black]
            appearance.stackedLayoutAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
            appearance.stackedLayoutAppearance.selected.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
            self.tabBar.standardAppearance = appearance
        }
        
        // MARK: 导航栏主体设置
        let barasppearance = UINavigationBar.appearance()
        barasppearance.tintColor = UIColor.black
        barasppearance.barTintColor = UIColor.white
        barasppearance.titleTextAttributes = [.foregroundColor : UIColor.black]
        // MARK: 导航栏全局返回图片处理，位置只能在控制器中对UIBarButtonItem.imageInsets进行调整
        barasppearance.backIndicatorImage = UIImage(named: "back")
        barasppearance.backIndicatorTransitionMaskImage = UIImage(named: "back")
        
        let itemasppearance = UIBarButtonItem.appearance()
        // MARK: 导航栏全局按钮文字颜色设置，iOS13.1不起作用
        itemasppearance.setTitleTextAttributes([.foregroundColor : UIColor.clear], for: .normal)
        itemasppearance.setTitleTextAttributes([.foregroundColor : UIColor.clear], for: .highlighted)
        
        return self
    }

}

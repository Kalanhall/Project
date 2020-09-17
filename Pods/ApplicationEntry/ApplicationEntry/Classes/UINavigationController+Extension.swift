//
//  UINavigationController+Extension.swift
//  ApplicationEntry
//
//  Created by Kalan on 2020/9/12.
//  

import Foundation

public enum NavAppearanceType {
    /// 返回按钮主题色
    case tincolor
    /// 导航栏背景主题色
    case barTincolor
    /// 全局导航栏返回按钮图片
    case backIndicatorImage
    /// 导航栏标题文本属性
    case titleTextAttributes
    /// 导航栏左右按钮标题文本属性，接收一个包含 元组类型为 ([NSAttributedString.Key : Any], UIControl.State) 的数组
    case barItemTextAttributes
}

public extension UINavigationController {
    
    /// 便利构造方法
    ///
    ///     UINavigationController.barAppearance(attributes: [NavAppearanceType.tincolor: UIColor.white])
    ///
    /// - Parameter rootViewController: 根控制器
    /// - Parameter title: 根控制器
    /// - Parameter image: 底部栏默认图片
    /// - Parameter selectedImage: 底部栏选中图片
    convenience init(rootViewController: UIViewController, title: String?, image: UIImage?, selectedImage: UIImage?) {
        self.init(rootViewController: rootViewController)
        self.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
    }
    
    /// 设置Bar主题
    ///
    ///     UINavigationController.barAppearance(attributes: [
    ///         NavAppearanceType.tincolor: UIColor.white,
    ///         .barTincolor: UIColor.purple,
    ///         .backIndicatorImage : UIImage(named: "back")!,
    ///         .titleTextAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
    ///                                NSAttributedString.Key.foregroundColor: UIColor.white],
    ///         .barItemTextAttributes: [([NSAttributedString.Key.foregroundColor: UIColor.clear], UIControl.State.normal),
    ///                                  ([NSAttributedString.Key.foregroundColor: UIColor.clear], .highlighted)]
    ///     ])
    ///
    /// - Parameter attributes: 设置对应属性及属性的值
    class func barAppearance(attributes: [NavAppearanceType : Any]?) {
        guard attributes != nil else {
            return
        }
        for attribute in attributes! {
            switch attribute.key {
            case .tincolor:
                UINavigationBar.appearance().tintColor = attribute.value as? UIColor
            case .barTincolor:
                UINavigationBar.appearance().barTintColor = attribute.value as? UIColor
            case .backIndicatorImage:
                UINavigationBar.appearance().backIndicatorImage = attribute.value as? UIImage
                UINavigationBar.appearance().backIndicatorTransitionMaskImage = attribute.value as? UIImage
            case .titleTextAttributes:
                UINavigationBar.appearance().titleTextAttributes = attribute.value as? [NSAttributedString.Key : Any]
            case .barItemTextAttributes:
                guard attribute.value is [([NSAttributedString.Key : Any], UIControl.State)] else {
                    return
                }
                for value in attribute.value as! [([NSAttributedString.Key : Any], UIControl.State)] {
                    let (titleTextAttributes, state) = value
                    UIBarButtonItem.appearance().setTitleTextAttributes(titleTextAttributes, for: state)
                }
            }
        }
    }

}

//
//  UITabBarController+Extension.swift
//  ApplicationEntry
//
//  Created by Kalan on 2020/9/12.
//  不同时兼容横竖屏，Frame实现

import Foundation

public enum TabAppearanceType {
    /// 选项栏标题文本属性，接收一个包含 元组类型为 ([NSAttributedString.Key : Any], UIControl.State) 的数组，必须设置了Normal状态的字体颜色,UIbarButtonItem的字体，颜色才会起作用
    case titleTextAttributes
    /// 文本垂直边距 UIOffset，统一调整iOS13无法为单个Item设置title位移，可以自定义按钮解决特殊场景
    case titlePositionAdjustment
    /// 图片边距支持多种格式
    ///
    ///     支持的数据格式：
    ///     UIEdgeInsets    全部设置
    ///     (UIEdgeInsets, [Int])   特殊调整
    ///     (UIEdgeInsets, UIEdgeInsets, [Int]) 全部设置，特殊调整
    case imageInsets
    /// 阴影线颜色 UIImage
    ///
    ///     注：iOS13以下，必须设置backgroundImage，否则无效
    case shadowImage
    /// 背景色 UIColor
    case backgroundColor
    /// 背景图 UIImage ，iOS13  backgroundEffect，如果需要透明的话，需要处理高斯模糊为nil
    ///
    ///     支持的数据格式：
    ///     UIImage    不处理高斯模糊
    ///     (UIImage, UIBlurEffect)   处理高斯模糊背景
    ///     (UIImage, Bool)   是否使用系统自带高斯模糊背景，默认true
    case backgroundImage
}

public extension UITabBarController {
    
    /// 便利构造方法，在AppDelegate中初始化可以使用
    convenience init(viewControllers: [UIViewController]?) {
        self.init()
        // 设置子控制器
        self.viewControllers = viewControllers
    }
    
    /// 在指定下标位置覆盖一个自定义视图，不同时兼容横竖屏
    ///
    /// - Parameter item: 自定义视图
    /// - Parameter index: tabBarIndex
    /// - Parameter width: 自定义视图宽，默认值 = 0，自动分配宽度与系统Item宽度一致
    /// - Parameter height: 自定义视图高，默认值 = 0，自动分配高度与系统Item高度一致
    /// - Parameter voffset: 垂直方向偏移值
    /// - Parameter systemItemEndable: 设置系统TabBarItem的Endable属性
    ///
    func overlayTabBarItem(_ item: UIView, index: Int, width: CGFloat = 0, height: CGFloat = 0, voffset: CGFloat = 0, systemItemEndable: Bool = true) {
        guard tabBar.items != nil else {
            return
        }
        
        var tempH: CGFloat = 0.0
        if height <= 0 {
            tempH = tabBar.bounds.size.height
        } else {
            tempH = height
        }
        
        let normalWidth = tabBar.bounds.size.width / CGFloat(tabBar.items!.count)
        let w = width > 0 ? width : normalWidth
        let x = CGFloat(index) * normalWidth
        let diff = tabBar.bounds.size.height - tempH
        let y = diff >= 0 ? 0 : diff
        item.frame = CGRect(x: x, y: y + voffset, width: w, height: tempH)
        item.tag = index
        tabBar.addSubview(item)
        tabBar.items![index].isEnabled = systemItemEndable
    }
    
    /// 在所有下标位置覆盖一个自定义视图，不同时兼容横竖屏
    func overlayTabBarItems(_ items: [UIView], width: CGFloat = 0, height: CGFloat = 0, voffset: CGFloat = 0, systemItemEndable: Bool = true) {
        guard tabBar.items != nil else {
            return
        }
        for (index, item) in items.enumerated() {
            if index < tabBar.items!.count {
                overlayTabBarItem(item, index: index, width: width, height: height, voffset: voffset)
            }
        }
    }
    
    /// 自定义背景
    func overlayTabBarBackgroundView(width: CGFloat = 0, height: CGFloat = 0, voffset: CGFloat = 0) -> UIImageView {
        let overlayView = UIImageView()
        var w: CGFloat = width
        var h: CGFloat = height
        if w == 0 { w = tabBar.bounds.size.width }
        if h == 0 {
            h = tabBar.bounds.size.height
            if #available(iOS 11.0, *) {
                h = h + UIApplication.shared.keyWindow!.safeAreaInsets.bottom
            }
        }
        overlayView.frame = CGRect(x: 0, y: 0 + voffset, width: w, height: h)
        tabBar.addSubview(overlayView)
        return overlayView
    }
    
    /// 设置Bar主题
    /// - Parameter attributes: 设置对应属性及属性的值
    func barAppearance(attributes: [TabAppearanceType : Any]?) {
        guard viewControllers != nil else {
            return
        }
        for attribute in attributes! {
            switch attribute.key {
            case .titleTextAttributes:
                guard attribute.value is [([NSAttributedString.Key : Any], UIControl.State)] else {
                    return
                }
                for value in attribute.value as! [([NSAttributedString.Key : Any], UIControl.State)] {
                    let (titleTextAttributes, state) = value
                    if #available(iOS 13.0, *) {
                        let appearance = tabBar.standardAppearance.copy()
                        switch state {
                        case .normal:
                            appearance.stackedLayoutAppearance.normal.titleTextAttributes = titleTextAttributes
                        case .selected:
                            appearance.stackedLayoutAppearance.selected.titleTextAttributes = titleTextAttributes
                        default:
                            break
                        }
                        tabBar.standardAppearance = appearance
                    } else {
                        for controller in viewControllers! {
                            controller.tabBarItem.setTitleTextAttributes(titleTextAttributes, for: state)
                        }
                    }
                }
            case .titlePositionAdjustment:
                guard attribute.value is UIOffset else {
                    return
                }
                if #available(iOS 13.0, *) {
                    let appearance = tabBar.standardAppearance.copy()
                    appearance.stackedLayoutAppearance.normal.titlePositionAdjustment = attribute.value as! UIOffset
                    appearance.stackedLayoutAppearance.selected.titlePositionAdjustment = attribute.value as! UIOffset
                    tabBar.standardAppearance = appearance
                } else {
                    for controller in viewControllers! {
                        controller.tabBarItem.titlePositionAdjustment = attribute.value as! UIOffset
                    }
                }
            case .imageInsets:
                switch attribute.value {
                case is UIEdgeInsets:
                    for controller in viewControllers! {
                        controller.tabBarItem.imageInsets = attribute.value as! UIEdgeInsets
                    }
                case is (UIEdgeInsets, [Int]):
                    let (special, specialIdxs) = attribute.value as! (UIEdgeInsets, [Int])
                    for (index, controller) in viewControllers!.enumerated() {
                        if specialIdxs.contains(index) {
                            controller.tabBarItem.imageInsets = special
                        }
                    }
                case is (UIEdgeInsets, UIEdgeInsets, [Int]):
                    let (all, special, specialIdxs) = attribute.value as! (UIEdgeInsets, UIEdgeInsets, [Int])
                    for (index, controller) in viewControllers!.enumerated() {
                        if specialIdxs.contains(index) {
                            controller.tabBarItem.imageInsets = special
                        } else {
                            controller.tabBarItem.imageInsets = all
                        }
                    }
                default:
                    break
                }
            case .shadowImage:
                guard attribute.value is UIImage else {
                    return
                }
                if #available(iOS 13.0, *) {
                    let appearance = tabBar.standardAppearance.copy()
                    appearance.shadowImage = attribute.value as? UIImage
                    tabBar.standardAppearance = appearance
                } else {
                    tabBar.shadowImage = attribute.value as? UIImage
                }
            case .backgroundColor:
                guard attribute.value is UIColor else {
                    return
                }
                if #available(iOS 13.0, *) {
                    let appearance = tabBar.standardAppearance.copy()
                    appearance.backgroundColor = attribute.value as? UIColor
                    tabBar.standardAppearance = appearance
                } else {
                    tabBar.backgroundColor = attribute.value as? UIColor
                }
            case .backgroundImage:
                if #available(iOS 13.0, *) {
                    let appearance = tabBar.standardAppearance.copy()
                    switch attribute.value {
                    case is UIImage:
                        appearance.backgroundImage = attribute.value as? UIImage
                    case is (UIImage, UIBlurEffect):
                        let (backgroundImage, effect) = attribute.value as! (UIImage, UIBlurEffect)
                        appearance.backgroundImage = backgroundImage
                        appearance.backgroundEffect = effect
                    case is (UIImage, Bool):
                        let (backgroundImage, result) = attribute.value as! (UIImage, Bool)
                        appearance.backgroundImage = backgroundImage
                        if result == false { appearance.backgroundEffect = nil }
                    default:
                        break
                    }
                    tabBar.standardAppearance = appearance
                } else {
                    switch attribute.value {
                    case is UIImage:
                        tabBar.backgroundImage = attribute.value as? UIImage
                    case is (UIImage, UIBlurEffect):
                        fallthrough
                    case is (UIImage, Bool):
                        let (backgroundImage, _) = attribute.value as! (UIImage, Any)
                        tabBar.backgroundImage = backgroundImage
                    default:
                        break
                    }
                }
            }
        }
    }
}

extension UITabBar {
    // iOS12以上，响应链结构发生变化，传递不到UITabBar
    @objc func swizzling_hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        for subview in subviews {
            let ctpoint = convert(point, to: subview)
            let view = subview.hitTest(ctpoint, with: event)
            if view != nil && view!.isUserInteractionEnabled == true && "\(view!.classForCoder)" != "UITabBarButton" {
                return view
            }
        }
        return swizzling_hitTest(point, with: event)
    }
    
    // Swift方法混写实现
    open override class func instanceMethod(for aSelector: Selector!) -> IMP! {
        _ = TabBarSwizzling.swizzling
        return super.instanceMethod(for: aSelector)
    }
    
    private class TabBarSwizzling {
        static let swizzling: TabBarSwizzling = {
            let original = class_getInstanceMethod(UITabBar.self, #selector(UITabBar.hitTest(_:with:)))
            let swizzled = class_getInstanceMethod(UITabBar.self, #selector(UITabBar.swizzling_hitTest(_:with:)))
            method_exchangeImplementations(original!, swizzled!);
            return TabBarSwizzling()
        }()
    }
}

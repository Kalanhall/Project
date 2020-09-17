//
//  TabBarController.swift
//  Project
//
//  Created by Kalan on 2020/9/16.
//  Copyright © 2020 Galanz. All rights reserved.
//

import UIKit
import ApplicationEntry
import Lottie

class TabBarController: UITabBarController {

    var currentItem: AnimationView?
    var overlayItems: [AnimationView]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NavigationController.barAppearance(attributes: [
            NavAppearanceType
            .tincolor: UIColor.black,
            .barTincolor: UIColor.white,
            .backIndicatorImage : UIImage(named: "back")!,
            .titleTextAttributes: [NSAttributedString.Key.foregroundColor: UIColor.black],
            .barItemTextAttributes: [([NSAttributedString.Key.foregroundColor: UIColor.clear], UIControl.State.normal),
                                     ([.foregroundColor: UIColor.clear], .highlighted)]
        ])

        let vc1 = NavigationController(rootViewController: HomeViewController(), title: nil, image: nil, selectedImage: nil)
        let vc2 = NavigationController(rootViewController: HomeViewController(), title: nil, image: nil, selectedImage: nil)
        let vc3 = NavigationController(rootViewController: HomeViewController(), title: nil, image: nil, selectedImage: nil)
        let vc4 = NavigationController(rootViewController: HomeViewController(), title: nil, image: nil, selectedImage: nil)
        let vc5 = NavigationController(rootViewController: HomeViewController(), title: nil, image: nil, selectedImage: nil)
        self.viewControllers = [vc1, vc2, vc3, vc4, vc5]

        barAppearance(attributes: [
            TabAppearanceType
            .backgroundImage: extension_imageWith(.white, size: CGSize(width: 1, height: 1))!
        ])

        let jsons: [String] = ["home", "category", "discover", "cart", "user"]
        overlayItems = overlayItems(jsons: jsons)
        guard overlayItems != nil else {
            return
        }
        overlayTabBarItems(overlayItems!, systemItemEndable: false)
    }
    
    func overlayItems(jsons: [String]) -> [AnimationView]? {
        guard jsons.count > 0 else {
            return nil
        }
        var items = [AnimationView]()
        for index in 0 ..< jsons.count {
            let name = jsons[index]
            let animation = Animation.named(name, subdirectory: "Animations")
            let item = AnimationView()
            item.animation = animation
            item.isUserInteractionEnabled = false
            items.append(item)
            if index == 0 {
                currentItem = item
                currentItem?.play()
            }
        }
        return items
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let index = tabBar.items?.firstIndex(of: item) else { return }
        if index == selectedIndex {
            print("Double Touch Refresh.")
        }
        let item = overlayItems?[index]
        currentItem?.stop()
        item?.play()
        currentItem = item
    }

}

extension NSObject {
    func extension_imageWith(_ color: UIColor, size: CGSize) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return theImage
    }
}

# ApplicationEntry

[![CI Status](https://img.shields.io/travis/kalanhall@163.com/ApplicationEntry.svg?style=flat)](https://travis-ci.org/kalanhall@163.com/ApplicationEntry)
[![Version](https://img.shields.io/cocoapods/v/ApplicationEntry.svg?style=flat)](https://cocoapods.org/pods/ApplicationEntry)
[![License](https://img.shields.io/cocoapods/l/ApplicationEntry.svg?style=flat)](https://cocoapods.org/pods/ApplicationEntry)
[![Platform](https://img.shields.io/cocoapods/p/ApplicationEntry.svg?style=flat)](https://cocoapods.org/pods/ApplicationEntry)

![image](https://github.com/Kalanhall/KLImagesSource/blob/master/ApplicationEntry/Simulator%20Screen%20Shot%20-%20iPhone%2011%20-%202020-09-16%20at%2008.39.10.png)
![image](https://github.com/Kalanhall/KLImagesSource/blob/master/ApplicationEntry/Simulator%20Screen%20Shot%20-%20iPhone%2011%20-%202020-09-16%20at%2009.12.10.png)
![image](https://github.com/Kalanhall/KLImagesSource/blob/master/ApplicationEntry/Simulator%20Screen%20Shot%20-%20iPhone%2011%20-%202020-09-16%20at%2009.12.17.png)
![image](https://github.com/Kalanhall/KLImagesSource/blob/master/ApplicationEntry/Simulator%20Screen%20Shot%20-%20iPhone%2011%20-%202020-09-16%20at%2009.12.21.png)
![image](https://github.com/Kalanhall/KLImagesSource/blob/master/ApplicationEntry/Simulator%20Screen%20Shot%20-%20iPhone%2011%20-%202020-09-16%20at%2009.12.33.png)
![image](https://github.com/Kalanhall/KLImagesSource/blob/master/ApplicationEntry/Simulator%20Screen%20Shot%20-%20iPhone%2011%20-%202020-09-16%20at%2009.12.41.png)
![image](https://github.com/Kalanhall/KLImagesSource/blob/master/ApplicationEntry/Simulator%20Screen%20Shot%20-%20iPhone%2011%20-%202020-09-16%20at%2009.12.51.png)

## Example

***  闲鱼：中间按钮凸起，交互参考 XianYuTabBarController.swift
```
barAppearance(attributes: [
    TabAppearanceType
    .titleTextAttributes: [([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11)], UIControl.State.normal),
                            ([NSAttributedString.Key.foregroundColor: UIColor.black], .normal),
                            ([NSAttributedString.Key.foregroundColor: UIColor.black], .selected)],
    .titlePositionAdjustment: UIOffset(horizontal: 0, vertical: -3),
    .imageInsets: (UIEdgeInsets(top: -3, left: 0, bottom: 3, right: 0), UIEdgeInsets(top: -15, left: 0, bottom: 15, right: 0), [2]), // 中间按钮图片调整
    .shadowImage: extension_imageWith(UIColor.clear, size: CGSize(width: 0.5, height: 0.5))!,
    .backgroundImage: extension_imageWith(UIColor.white, size: CGSize(width: 1, height: 1))!
])

let item = HotBtn(type: .custom)
item.addTarget(self, action: #selector(itemSelected), for: .touchUpInside)
overlayTabBarItem(item, index: 2, height: 74)

```

***  京东：Lottie动画，动画交互参考 JingDongTabBarController.swift
```
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

```

***  小红书：自定义按钮，交互参考 HotBookTabBarController.swift
```
barAppearance(attributes: [
    TabAppearanceType
    .shadowImage: extension_imageWith(.clear, size: CGSize(width: 0.5, height: 0.5))!,
    .backgroundImage: extension_imageWith(.white, size: CGSize(width: 1, height: 1))!
])
let titles: [String] = ["首页", "商城", "", "消息", "我"]
let items = overlayItems(titles: titles)
overlayTabBarItems(items!, systemItemEndable: false)

```

## Requirements

## Installation

ApplicationEntry is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ApplicationEntry'
```

## Author

kalanhall@163.com, wujm002@galanz.com

## License

ApplicationEntry is available under the MIT license. See the LICENSE file for more info.

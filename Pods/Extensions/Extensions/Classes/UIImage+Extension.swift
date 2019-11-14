//
//  UIImage+Extension.swift
//  Extensions
//
//  Created by Logic on 2019/11/13.
//

import Foundation

public extension UIImage {
    
    var original: UIImage {
        return self.withRenderingMode(.alwaysOriginal);
    }
    
    /// 用于私有库中获取私有库bundle中图片资源
    ///
    /// 使用示例：
    ///
    ///      UIImage.image(named: "", in: Bundle(for: type(of: self)))?.original
    ///      UIImage.image(color: UIColor.black)
    ///      UIImage.image(color: UIColor.black with:CGSize(width: 1, height: 1))
    ///
    /// - Parameter named: 图片名称
    /// - Parameter in: Bundle实例，Bundle(for: type(of: 私有库中的任意自定义类的实例))
    ///
    /// - Returns: 一张图片
    class func image(named imageName: String, in bundle: Bundle?) -> UIImage? {
        if let url = URL(string: bundle?.bundleIdentifier ?? "")
        {
            if let bundleURL = bundle?.url(forResource: url.pathExtension, withExtension: "bundle")
            {
                let imageBundle = Bundle(url: bundleURL)
                return UIImage(named: imageName, in: imageBundle, compatibleWith: nil)
            }
        }
        return nil
    }
    
    class func image(color: UIColor, with size:CGSize) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return theImage
    }
    
    class func image(color: UIColor) -> UIImage? {
        return self.image(color: color, with: CGSize(width: 1, height: 1))
    }
}

//
//  AppDelegate+Extension.swift
//  Project
//
//  Created by Logic on 2020/3/13.
//  Copyright © 2020 Galanz. All rights reserved.
//

import UIKit
import KLConsole
import IQKeyboardManagerSwift
import WebKit

extension AppDelegate {
    
    /// 第三方工具初始化
    func applicationDidFinishLibLaunch() -> Void {
        IQKeyboardManager.shared.enable = true
    }
    
    /// 控制台初始化 | 服务器地址、调试工具、扩展工具
    func applicationDidFinishServiceLaunch() -> Void {
        
        KLConsole.consoleAddressSetup { (configs) in
            
            // MARK: 业务A
            let A = KLConsoleSecondConfig()
            let Aa = KLConsoleThreeConfig()
            Aa.title = "开发环境"
            Aa.text = "https://www.baidu.com/dev"
            
            let Ab = KLConsoleThreeConfig()
            Ab.title = "测试环境"
            Ab.text = "https://www.baidu.com/test"
            
            let Ac = KLConsoleThreeConfig()
            Ac.title = "预发布环境"
            Ac.text = "https://www.baidu.com/stg"
            
            let Ad = KLConsoleThreeConfig()
            Ad.title = "生产环境"
            Ad.text = "https://www.baidu.com/pro"
            
            // MARK: 业务B
            let B = KLConsoleSecondConfig()
            let Ba = KLConsoleThreeConfig()
            Ba.title = "开发环境"
            Ba.text = "https://www.baidu.com/dev"
            
            let Bb = KLConsoleThreeConfig()
            Bb.title = "测试环境"
            Bb.text = "https://www.baidu.com/test"
            
            let Bc = KLConsoleThreeConfig()
            Bc.title = "预发布环境"
            Bc.text = "https://www.baidu.com/stg"
            
            let Bd = KLConsoleThreeConfig()
            Bd.title = "生产环境"
            Bd.text = "https://www.baidu.com/pro"
            
            A.details = [Aa, Ab, Ac, Ad]
            B.details = [Ba, Bb, Bc, Bd]
            configs.addObjects(from: [A, B])
            
            A.version = "1.0.0"
            A.title = "A业务"
            A.selectedIndex = 0
            A.subtitle = A.details[A.selectedIndex].text
            
            B.version = "1.0.0"
            B.title = "B业务"
            B.selectedIndex = 0
            B.subtitle = B.details[B.selectedIndex].text
            
        }
        
        KLConsole.consoleSetup { (configs) in
            let A = KLConsoleConfig()
            A.title = "扩展工具"
            
            let Aa = KLConsoleSecondConfig()
            Aa.title = "H5测试"
            Aa.subtitle = "WKWebViewH5访问"
            
            A.infos = [Aa]
            configs.addObjects(from: [A])
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(console))
        tap.numberOfTapsRequired = 3
        tap.numberOfTouchesRequired = 2
        window?.rootViewController?.view.addGestureRecognizer(tap)
    }
    
    @objc func console() {
        KLConsole.consoleSetupAndSelectedCallBack { (indexPath, on) in
            print("index: \(indexPath) on:\(on)")
        }
    }

}

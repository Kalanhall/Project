//
//  LoginService.swift
//  LoginService
//
//  Created by Logic on 2019/11/13.
//

import UIKit

@objc class LoginService: NSObject {
    @objc func nativeToLogin(_ parameters: NSDictionary) -> UIViewController {
        let vc = LoginController()
        return vc;
    }
}

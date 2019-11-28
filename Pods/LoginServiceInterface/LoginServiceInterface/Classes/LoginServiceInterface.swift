//
//  LoginServiceInterface.swift
//  LoginServiceInterface
//
//  Created by Logic on 2019/11/14.
//

@_exported import KLServer

public extension KLServer {
    @objc public func login(with parameters:  NSDictionary?) -> UIViewController {
        var params = (parameters ?? [:]) as! [AnyHashable : Any]
        params.updateValue("LoginService", forKey: kKLServerParamsKey)
        if let vc = self.performService("LoginService", task: "nativeToLogin", params: params, shouldCacheService: false) as? UIViewController {
            return vc
        }
        return UIViewController()
    }
}

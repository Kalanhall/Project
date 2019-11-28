//
//  LoginNextController.swift
//  LoginService
//
//  Created by Logic on 2019/11/19.
//

import UIKit
import RxSwift
import RxCocoa
import KLProgressHUD

class LoginNextController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    lazy var loginView: LoginView = {
        let loginView = LoginView()
        loginView.accountView.forget.isHidden = false
        loginView.accountView.wxBtn.isHidden = true
        loginView.accountView.qqBtn.isHidden = true
        loginView.accountView.accountTF.placeholder = "输入您的密码"
        loginView.accountView.accountTF.isSecureTextEntry = true
        loginView.userName.text = "Swift"
        loginView.loginBtn.setTitle("登 录", for: .normal)
        loginView.regisBtn.setTitle("注 册", for: .normal)
        return loginView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.kl_barShadowHidden = true
        self.kl_barAlpha = 0
        
        view.addSubview(loginView)
        loginView.snp_makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        loginView.loginBtn.rx.tap
            .subscribe { [weak self] (Void) in self?.showLoginView() }
            .disposed(by: disposeBag)
        
        // 头像
        let url = URL(string: "http://i0.hdslb.com/bfs/article/c3d2fdf4e0f251027bfa586de18b877f042c18db.jpg")
        loginView.userIcon.yy_setImage(with: url, placeholder: UIImage.image(named: "icon", in:Bundle(for: type(of: self))), options: .progressiveBlur) { [weak self] (image, url, type, stage, error) in
            if image != nil {
                self?.loginView.userIcon.contentMode = .scaleAspectFill
            } else {
                self?.loginView.userIcon.contentMode = .center
            }
        }
    }

    func showLoginView() {
        if loginView.accountView.accountTF.text?.isEmpty ?? false {
            KLProgressHUD.showBottomText("请输入密码")
        } else {
            KLProgressHUD.showIndicatorText("登陆中", to: self.view)
            DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 2) {
                DispatchQueue.main.async {
                    KLProgressHUD.hide(from: self.view)
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }

}

//
//  LoginView.swift
//  LoginService
//
//  Created by Logic on 2019/11/15.
//

import UIKit

class LoginView: UIView {
    
    let logo        = UIImageView()
    let logoTitle   = UILabel()
    let accountView = CustomShadowView()
    let userIcon    = UIImageView()
    let userName    = UILabel()
    let loginBtn    = UIButton()
    let regisBtn    = UIButton()
    let backBtn     = UIButton() // 返回按钮
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.color(hexNumber: 0xF8F8F8)
            
        accountView.accountTF.clearButtonMode = .whileEditing
        addSubview(accountView)
        accountView.snp_makeConstraints { (make) in
            make.left.equalTo(30.auto())
            make.right.equalTo(-30.auto())
            make.height.equalTo(accountView.snp_width).multipliedBy(0.8)
            make.centerY.equalToSuperview().offset(50.auto())
        }
        accountView.layer.shadowColor = UIColor.black.cgColor
        accountView.layer.shadowOpacity = 0.1
        accountView.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        logo.image = UIImage.image(named: "logo", in:Bundle(for: type(of: self)))
        logo.contentMode = .scaleAspectFit
        addSubview(logo)
        logo.snp_makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(accountView.snp_top).inset(-100.auto())
            make.width.height.equalTo(60.auto())
        }
        
        logoTitle.text = "SWIFT PROJECT"
        logoTitle.font = UIFont.boldSystemFont(ofSize: 15.auto())
        addSubview(logoTitle)
        logoTitle.snp_makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(logo.snp_bottom).inset(-5)
        }
        
        // Another shadow
        let shadow = UIView()
        shadow.backgroundColor = UIColor.white
        insertSubview(shadow, belowSubview: accountView)
        shadow.snp_makeConstraints { (make) in
            make.left.right.equalTo(accountView).inset(15.auto())
            make.bottom.equalTo(accountView).inset(-5)
            make.height.equalTo(20)
        }
        shadow.layer.shadowColor = UIColor.black.cgColor
        shadow.layer.shadowOpacity = 0.1
        shadow.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        userIcon.layer.cornerRadius = 30
        userIcon.layer.masksToBounds = true
        userIcon.backgroundColor = UIColor.color(hexNumber: 0xF5F5F5)
        userIcon.contentMode = .center
        userIcon.image = UIImage.image(named: "icon", in:Bundle(for: type(of: self)))
        addSubview(userIcon)
        userIcon.snp_makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(accountView)
            make.width.height.equalTo(60.auto())
        }
        
        userName.font = UIFont.boldSystemFont(ofSize: 15.auto())
        userName.textAlignment = .center
        addSubview(userName)
        userName.snp_makeConstraints { (make) in
            make.left.right.equalTo(accountView).inset(15)
            make.top.equalTo(userIcon.snp_bottom).inset(-10)
        }
        
        loginBtn.layer.cornerRadius = 20.auto()
        loginBtn.layer.masksToBounds = true
        loginBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14.auto())
        loginBtn.setTitleColor(UIColor.black, for: .highlighted)
        loginBtn.setBackgroundImage(UIImage.image(color: UIColor.black), for: .normal)
        loginBtn.setBackgroundImage(UIImage.image(color: UIColor.color(hexNumber: 0xF8F8F8)), for: .highlighted)
        addSubview(loginBtn)
        loginBtn.snp_makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(accountView.snp_bottom)
            make.width.equalTo(120.auto())
            make.height.equalTo(40.auto())
        }
        
        let loginbg = UIView()
        loginbg.backgroundColor = UIColor.white
        loginbg.layer.shadowColor = UIColor.black.cgColor
        loginbg.layer.shadowOpacity = 0.2
        loginbg.layer.shadowOffset = CGSize(width: 0, height: 3)
        loginbg.layer.cornerRadius = 20
        insertSubview(loginbg, belowSubview: loginBtn)
        loginbg.snp_makeConstraints { (make) in
            make.edges.equalTo(loginBtn)
        }
        
        regisBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14.auto())
        regisBtn.setTitleColor(UIColor.black, for: .normal)
        regisBtn.setTitleColor(UIColor.lightGray, for: .highlighted)
        addSubview(regisBtn)
        regisBtn.snp_makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(accountView.snp_bottom).inset(-40.auto())
            make.width.equalTo(120.auto())
            make.height.equalTo(40.auto())
        }
        regisBtn.layer.shadowColor = UIColor.black.cgColor
        regisBtn.layer.shadowOpacity = 0.2
        regisBtn.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        backBtn.setImage(UIImage.image(named: "back2", in:Bundle(for: type(of: self))), for: .normal)
        addSubview(backBtn)
        backBtn.snp_makeConstraints { (make) in
            make.centerY.equalTo(regisBtn)
            make.left.equalTo(30.auto())
        }
        backBtn.layer.shadowColor = UIColor.black.cgColor
        backBtn.layer.shadowOpacity = 0.2
        backBtn.layer.shadowOffset = CGSize(width: 3, height: 3)
        backBtn.alpha = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomShadowView: UIView {
    
    let line    = UIView()
    let accountTF = UITextField()
    let forget  = UIButton()
    let wxBtn   = UIButton() // 微信登陆
    let qqBtn   = UIButton() // QQ登陆
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        
        line.backgroundColor = UIColor.color(hexNumber: 0xE5E5E5)
        addSubview(line)
        line.snp_makeConstraints { (make) in
            make.left.equalTo(30.auto())
            make.right.equalTo(-30.auto())
            make.height.equalTo(1)
            make.centerY.equalToSuperview().inset(30.auto())
        }
        
        accountTF.textAlignment = .center
        accountTF.textColor = UIColor.black
        accountTF.font = UIFont.systemFont(ofSize: 14.auto())
        addSubview(accountTF)
        accountTF.snp_makeConstraints { (make) in
            make.left.right.equalTo(line)
            make.bottom.equalTo(line.snp_top)
            make.height.equalTo(35.auto())
        }
        
        forget.titleLabel?.font = UIFont.systemFont(ofSize: 12.auto())
        forget.setTitle("忘记密码?", for: .normal)
        forget.setTitleColor(UIColor.color(hexNumber: 0x666666), for: .normal)
        forget.setTitleColor(UIColor.lightGray, for: .highlighted)
        forget.isHidden = true
        addSubview(forget)
        forget.snp_makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(line.snp_bottom).inset(-15.auto())
            make.height.equalTo(40.auto())
            make.width.equalTo(150.auto())
        }

        wxBtn.setImage(UIImage.image(named: "wx", in:Bundle(for: type(of: self))), for: .normal)
        addSubview(wxBtn)
        wxBtn.snp_makeConstraints { (make) in
            make.centerY.equalTo(forget)
            make.right.equalTo(self.snp_centerX).inset(-10)
        }
        wxBtn.layer.shadowColor = UIColor.black.cgColor
        wxBtn.layer.shadowOpacity = 0.2
        wxBtn.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        qqBtn.setImage(UIImage.image(named: "qq", in:Bundle(for: type(of: self))), for: .normal)
        addSubview(qqBtn)
        qqBtn.snp_makeConstraints { (make) in
            make.centerY.equalTo(forget)
            make.left.equalTo(self.snp_centerX).inset(10)
        }
        qqBtn.layer.shadowColor = UIColor.black.cgColor
        qqBtn.layer.shadowOpacity = 0.2
        qqBtn.layer.shadowOffset = CGSize(width: 3, height: 3)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(UIColor.white.cgColor)
        context?.move(to: CGPoint(x: 0, y: self.bounds.size.height * 1/4.0))
        context?.addLine(to: CGPoint(x: self.bounds.size.width, y: 0))
        context?.addLine(to: CGPoint(x: self.bounds.size.width, y: self.bounds.size.height))
        context?.addLine(to: CGPoint(x: 0, y: self.bounds.size.height))
        context?.closePath()
        context?.fillPath()
        super.draw(rect)
    }

}

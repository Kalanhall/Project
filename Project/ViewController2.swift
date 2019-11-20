//
//  ViewController2.swift
//  Project
//
//  Created by Logic on 2019/11/13.
//  Copyright © 2019 Galanz. All rights reserved.
//

import UIKit
import LoginServiceInterface
import RxSwift
import RxCocoa
import KLNavigationController

class ViewController2: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .plain)
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "二级页"
        
//        if #available(iOS 11.0, *) {
//            tableView.contentInsetAdjustmentBehavior = .never
//        } else {
//            self.automaticallyAdjustsScrollViewInsets = true
//        }
//        
//        view.addSubview(tableView)
//        tableView.snp_makeConstraints { (make) in
//            make.edges.equalToSuperview()
//        }
//        
//        
//        tableView.rx.contentOffset.subscribe { [weak self] (contenOffset) in
//            print("\(self!.view!)")
//        }.disposed(by: disposeBag)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = KLServer.shared().login(with: nil)
        let nc = KLNavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        self.present(nc, animated: true, completion: nil)
    }
    
}

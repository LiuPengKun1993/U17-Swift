//
//  LPKBaseViewController.swift
//  U17-Swift
//
//  Created by liupengkun on 2020/7/9.
//  Copyright © 2020 刘朋坤. All rights reserved.
//

import UIKit

class LPKBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.lpk_backgroundColor
        
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNavigationBar()
    }
    
    func setupLayout() {}
    
    func configNavigationBar() {
        guard let navi = navigationController else {
            return
        }
        
        if navi.visibleViewController == self {
            navi.lpk_barStyle(.lpk_theme)
            navi.lpk_disablePopGesture = false
            navi.setNavigationBarHidden(false, animated: true)
            if navi.viewControllers.count > 1 {
                navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_back_white"), target: self, action: #selector(popback))
            }
        }
    }
    
    @objc func popback() {
        navigationController?.popViewController(animated: true)
    }

}

extension LPKBaseViewController {
    // 改变状态条颜色
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}

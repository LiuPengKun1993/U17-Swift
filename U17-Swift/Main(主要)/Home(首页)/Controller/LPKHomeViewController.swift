//
//  LPKHomeViewController.swift
//  U17-Swift
//
//  Created by liupengkun on 2020/7/9.
//  Copyright © 2020 刘朋坤. All rights reserved.
//

import UIKit

class LPKHomeViewController: LPKPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func configNavigationBar() {
        super.configNavigationBar()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_search"),target: self,action: #selector(searchButtonClick))
    }
    
    @objc func searchButtonClick() {
        navigationController?.pushViewController(LPKHomeSearchViewController(), animated: true)
    }

}

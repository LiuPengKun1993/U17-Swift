//
//  LPKTabBarController.swift
//  U17-Swift
//
//  Created by liupengkun on 2020/7/9.
//  Copyright © 2020 刘朋坤. All rights reserved.
//

import UIKit

class LPKTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.isTranslucent = false
        
        confChildController()
    }
    
    func confChildController() {
        
        // 首页
        let homeVC = LPKHomeViewController(titles: ["推荐", "VIP", "订阅", "排行"], childVCs: [LPKHomeRecommendViewController(), LPKHomeVIPViewController(), LPKHomeSubscibeViewController(), LPKHomeRankViewController()], pageStyle: .navgationBarSegment)
        
        addChildController(homeVC, title: "首页", image: UIImage(named: "tab_home"), selectedImage: UIImage(named: "tab_home_S"))
        
        // 分类
        let categoryVC = LPKCategoryViewController()
        
        addChildController(categoryVC, title: "分类", image: UIImage(named: "tab_class"), selectedImage: UIImage(named: "tab_class_S"))
        
        // 书架
        let bookVC = LPKBookViewController(titles: ["收藏", "书单", "下载"], childVCs: [LPKBookCollectionViewController(), LPKBookDocumentViewController(), LPKBookDownloadViewController()], pageStyle: .navgationBarSegment)
        
        addChildController(bookVC, title: "书架", image: UIImage(named: "tab_book"), selectedImage: UIImage(named: "tab_book_S"))
        
        // 我的
        let mineVC = LPKMineViewController()
        addChildController(mineVC, title: "我的", image: UIImage(named: "tab_mine"), selectedImage: UIImage(named: "tab_mine_S"))
    }
    

    func addChildController(_ childController: UIViewController, title:String?, image:UIImage? ,selectedImage:UIImage?) {
        
        childController.title = title
        
        childController.tabBarItem = UITabBarItem(title: nil, image: image?.withRenderingMode(.alwaysOriginal), selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
        
        // 判断是否是 phone 设备
        if UIDevice.current.userInterfaceIdiom == .phone {
            childController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        
        addChild(LPKNavigationController(rootViewController: childController))
    }

}


extension LPKTabBarController {
    // 改变状态条颜色
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let select = selectedViewController else { return .lightContent }
        return select.preferredStatusBarStyle
    }
}

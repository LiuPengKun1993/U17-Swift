//
//  AppDelegate.swift
//  U17-Swift
//
//  Created by liupengkun on 2020/7/9.
//  Copyright © 2020 刘朋坤. All rights reserved.
//

import UIKit
import CoreData
import Alamofire
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        // 点击键盘之外部分收起键盘
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
        /*
         启动不使用 Main.storyBoard
         1.TARGETS 中移除 Main Interface
         2.删除 Info.plist 文件的 Application Scene Manifest
         3.添加以下代码
         */
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = LPKTabBarController()
        window?.makeKeyAndVisible()
        return true
    }
}


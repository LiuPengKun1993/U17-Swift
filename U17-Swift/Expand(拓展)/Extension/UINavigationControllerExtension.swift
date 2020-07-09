//
//  UINavigationControllerExtension.swift
//  U17-Swift
//
//  Created by liupengkun on 2020/7/9.
//  Copyright © 2020 刘朋坤. All rights reserved.
//

import UIKit

// 枚举
enum LPKNavigationBarStyle {
    case lpk_theme
    case lpk_clear
    case lpk_white
}

extension UINavigationController {
    
    private struct AssociatedKeys {
        static var lpk_disablePopGesture: Void?
    }
    
    var lpk_disablePopGesture: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.lpk_disablePopGesture) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.lpk_disablePopGesture, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func lpk_barStyle(_ style: LPKNavigationBarStyle) {
        switch style {
        case .lpk_theme:
            navigationBar.barStyle = .black
            navigationBar.setBackgroundImage(UIImage(named: "nav_bg"), for: .default)
            navigationBar.shadowImage = UIImage()
        case .lpk_clear:
            navigationBar.barStyle = .black
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
        case .lpk_white:
            navigationBar.barStyle = .default
            navigationBar.setBackgroundImage(UIColor.white.image(), for: .default)
            navigationBar.shadowImage = nil
        }
    }
}


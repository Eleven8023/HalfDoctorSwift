//
//  Theme.swift
//  DoctorSwift
//
//  Created by Eleven on 16/11/14.
//  Copyright © 2016年 Eleven. All rights reserved.
//

import Foundation
import UIKit

public struct Theme {
    // info.plist
    static let infoDictionary = Bundle.main.infoDictionary!
    // 项目名称
    static let executable = Theme.infoDictionary[String(kCFBundleExecutableKey)]
    // bundle Identifier
    static let identifer = Bundle.main.bundleIdentifier!
    // version 版本号
    static let shortVersion = Theme.infoDictionary["CFBundleShortVersionString"]
    // build版本号
    static let version = Theme.infoDictionary[String(kCFBundleVersionKey)]
    // app名称
    static let appName = Theme.infoDictionary[String(kCFBundleNameKey)]
    // app定位区域
    static let localizations = Theme.infoDictionary[String(kCFBundleLocalizationsKey)]

}

// MARK: -- 全局常用属性
public let NavigationH:CGFloat = 64
public let ScreenWidth:CGFloat = UIScreen.main.bounds.size.width
public let ScreenHeight:CGFloat = UIScreen.main.bounds.size.height
public let ScreenBounds:CGRect = UIScreen.main.bounds
public let AppDownloadUrl:String = "https://itunes.apple.com/cn/app/ban-ge-yi-sheng-zui-zhuan/id949812115?mt=8"
public let subjectColor = ColorRGB(70,g: 70,b: 70)
public let mainColor = ColorRGB(35,g: 189,b: 57)
/**
 *  RGBA颜色
 */
func ColorRGBA(_ r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) -> UIColor {
    
    return UIColor(red:r/255.0,green:g/255.0,blue:b/255.0,alpha:a)
}
/**
 *  RGB颜色
 */
func ColorRGB(_ r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor {
    
    return ColorRGBA(r, g: g, b: b, a: 1.0)
}









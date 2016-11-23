//
//  UIBarButtonItem+Extension.swift
//  DoctorSwift
//
//  Created by Eleven on 16/11/16.
//  Copyright © 2016年 Eleven. All rights reserved.
//

import Foundation
import UIKit

enum ItemButtonType: Int {
    case Left = 0
    case Right = 1
}

extension UIBarButtonItem {
// MARK:上文下字类型
    class func barButton(title: String, titleColor: UIColor, image: UIImage?, hightLightImage: UIImage?, target:AnyObject?,action: Selector, type: ItemButtonType) -> UIBarButtonItem {
        var btn: UIButton = UIButton()
        if type == ItemButtonType.Left{
            btn = ItemLeftButton(type: .custom)
        }else{
            btn = ItemRightButton(type: .custom)
        }
        btn.setTitleColor(titleColor, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.setImage(image, for: .normal)
        btn.setTitle(title, for: .normal)
        btn.addTarget(target, action: action, for: .touchUpInside)
        btn.frame = CGRect(x:0,y:0,width:60,height:44)
        
        return UIBarButtonItem(customView: btn)
    }
// MARK:左文右字类型
    class func barButton(image:UIImage, title:String, titleColor:UIColor,target:AnyObject?,action: Selector) -> UIBarButtonItem {
        let btn = UIButton(type: .custom)
        btn.setImage(image, for: UIControlState
        .normal)
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.setTitleColor(titleColor, for: .normal)
        btn.frame = CGRect(x:0,y:0,width:64,height:44)
        btn.addTarget(target, action: action, for: .touchUpInside)
        return UIBarButtonItem(customView: btn)
    }
    
    
}




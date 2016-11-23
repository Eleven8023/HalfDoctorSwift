//
//  UIView+Extension.swift
//  DoctorSwift
//
//  Created by Eleven on 16/11/16.
//  Copyright © 2016年 Eleven. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    var x: CGFloat{
        return self.frame.origin.x
    }
    var y: CGFloat{
        return self.frame.origin.y
    }
    var width: CGFloat{
        return self.frame.size.width
    }
    var height:CGFloat{
        return self.frame.size.height
    }
    var point: CGPoint{
        return self.frame.origin
    }
}






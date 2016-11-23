//
//  NetworkConfiguration.swift
//  DoctorSwift
//
//  Created by Eleven on 16/11/14.
//  Copyright © 2016年 Eleven. All rights reserved.
//
import Foundation
import UIKit

public enum HTTPRequestEnviromentType:NSInteger{
    case enumAppEnviromentDevelop
    case enumAppEnviromentTest
    case enumAppEnviromentProduction
}

public let KAppEnviroment = HTTPRequestEnviromentType.enumAppEnviromentDevelop
public let EnumAppEnviromentDev:String = ""
public let EnumAppEnviromentTest:String = ""
public let EnumAppEnviromentProduct:String = ""




//
//  TBMediator.swift
//  KKBCCloundManager
//
//  Created by 王绵杰 on 2017/1/13.
//  Copyright © 2017年 王绵杰. All rights reserved.
//

import UIKit

class TBMediator: NSObject {

    internal static let sharedInstance = TBMediator()
    
    func performTarget(targetName:String ,actionName:String , parameters:Dictionary<String, Any>) -> AnyObject? {
        let targetClassString : String = "Target_\(targetName)"
        let actionString : String = "action_\(actionName)"
        
        let target : AnyClass? = NSClassFromString(targetClassString)!
        let action : Selector = NSSelectorFromString(actionString)
        
        if target == nil {
            return nil
        }
        return targetClassString as AnyObject
    }
}

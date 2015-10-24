//
//  Todo.swift
//  to do 2
//
//  Created by kosuge satoshi on 2015/10/21.
//  Copyright © 2015年 kosuge satoshi. All rights reserved.
//

import UIKit

class Todo: NSObject {
    var title = ""
    var descript = ""
    var priority:TodoPrioty = .Low
}
enum TodoPrioty: Int{
    case Low = 0
    case middle = 1
    case High = 2
    
    func color() -> UIColor{
        switch self{
        case .Low:
            return UIColor.yellowColor()
        case .middle:
            return UIColor.blueColor()
        case .High:
            return UIColor.redColor()
        
        }
    }
}
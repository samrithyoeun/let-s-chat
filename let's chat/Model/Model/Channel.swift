//
//  Channel.swift
//  let's chat
//
//  Created by PM Academy 3 on 7/25/18.
//  Copyright © 2018 PM Academy 3. All rights reserved.
//

import Foundation
struct Channel {
    var name  = ""
    var count = 0
    var id = ""
    
    public func getLabel() -> String{
        return "\(name)(\(count))"
    }
}

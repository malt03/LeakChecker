//
//  WeakHolder.swift
//  Pods
//
//  Created by Koji Murata on 2016/08/18.
//
//

import Foundation

class WeakHolder: Hashable {
    let hashValue = NSUUID().hashValue
    weak var object: AnyObject?
    
    init(_ object: AnyObject) {
        self.object = object
    }
}

func ==(lhs: WeakHolder, rhs: WeakHolder) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

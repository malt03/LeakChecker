//
//  LeakChecker.swift
//  Pods
//
//  Created by Koji Murata on 2016/08/18.
//
//

import Foundation

public class LeakChecker {
    public static let sharedInstance = LeakChecker()
    
    public typealias CountHandler = (leakCount: Int) -> Void
    
    public func append(object: AnyObject) {
        for holder in weakHolders {
            if holder.object === object { return }
        }
        weakHolders.insert(WeakHolder(object))
    }
    
    public var leakCount: Int {
        return leakObjects.count
    }
    
    public var leakObjects: [AnyObject] {
        return weakHolders.flatMap { $0.object }
    }
    
    public func startCounting(interval: NSTimeInterval, handler: CountHandler) {
        stopCounting()
        countHandler = handler
        countTimer = NSTimer.scheduledTimerWithTimeInterval(interval, target: self, selector: #selector(count), userInfo: nil, repeats: true)
    }
    
    public func stopCounting() {
        countTimer?.invalidate()
        countHandler = nil
    }
    
    private init() {}
    
    private var weakHolders = Set<WeakHolder>()
    private var countTimer: NSTimer?
    private var countHandler: CountHandler?
    
    @objc private func count() {
        countHandler?(leakCount: leakCount)
    }
}

//
//  ViewController.swift
//  LeakChecker
//
//  Created by Koji Murata on 08/18/2016.
//  Copyright (c) 2016 Koji Murata. All rights reserved.
//

import UIKit
import LeakChecker

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let obj0 = NSDate()
        LeakChecker.sharedInstance.append(obj0)
        do {
            let obj1 = NSDate()
            LeakChecker.sharedInstance.append(obj1)
            print(LeakChecker.sharedInstance.leakCount)
        }
        print(LeakChecker.sharedInstance.leakCount)
    }
}

//
//  ViewController.swift
//  HealthKitTestData
//
//  Created by Ricky Kirkendall on 6/25/18.
//  Copyright © 2018 Ricky Kirkendall. All rights reserved.
//

import UIKit
import HealthKit
import SwiftDate
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {    
        super.viewDidAppear(animated)
        let hkTypes = HKObjectTypes()
        
        HKFakeData().permission(sampleTypes: hkTypes.writables, successBlock: {
            let tenDaysAgo = Date() - 2.weeks
            HKFakeData().writeDataSince(since: tenDaysAgo)
        })            
        
    }

    
}


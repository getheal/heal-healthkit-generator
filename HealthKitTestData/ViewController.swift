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
    
    override func viewDidAppear(_ animated: Bool) {    
        super.viewDidAppear(animated)
        let hkTypes = HKObjectTypes()
        let fakeData = HKFakeData()
        fakeData.sampleTypes = hkTypes.writables
        fakeData.permission(successBlock: {
            fakeData.writeDataSince(since: (Date() - 8.month))
        })
    }    
}


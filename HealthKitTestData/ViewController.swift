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
        let sampleData = HKSampleData()
        sampleData.sampleTypes = hkTypes.writables
        sampleData.permission(successBlock: {
            sampleData.writeDataSince(since: (Date() - 20.days))
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("WARNING: RUNNING HOT")
    }
}

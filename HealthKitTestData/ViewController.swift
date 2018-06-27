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
        
        let tenDaysAgo = Date() - 10.days
        //Health().writeDataSince(since: tenDaysAgo)
        
        //Health().writeDataSince(since: Date())
        
        Health().permission()
//        Health().writeData()
//        guard let bmiSampleType = HKSampleType.quantityType(forIdentifier: .bodyMassIndex) else {
//            print("Height Sample Type is no longer available in HealthKit")
//            return
//        }
//        Health().getMostRecentSample(for: bmiSampleType) { (sample, error) in
//            print(sample!.quantity.doubleValue(for: HKUnit.count()))
//        }
    }

    
}


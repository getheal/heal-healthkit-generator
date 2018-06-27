//
//  HKQuantityType+compatibleUnit.swift
//  HealthKitTestData
//
//  Created by Ricky Kirkendall on 6/26/18.
//  Copyright © 2018 Ricky Kirkendall. All rights reserved.
//

import Foundation
import HealthKit
extension HKQuantityType{
    func compatibleUnit() -> HKUnit?{
        // One unit of each kind. They are all convertible
        let basicUnits = [HKUnit.gram(),
                     HKUnit.foot(),
                     HKUnit.liter(),
                     HKUnit.pascal(),
                     HKUnit.minute(),
                     HKUnit.kilocalorie(),
                     HKUnit.degreeFahrenheit(),
                     HKUnit.siemen(),
                     HKUnit.internationalUnit(),
                     HKUnit.count(),
                     ]
        var divUnits: [HKUnit] = []
        for unitA in basicUnits {
            for unitB in basicUnits{
                if unitA != unitB{
                    divUnits.append(unitA.unitDivided(by: unitB))
                }
            }
        }
        
        var units: [HKUnit] = []
        units.append(contentsOf: basicUnits)
        units.append(contentsOf: divUnits)
        units.append(HKUnit.liter().unitDivided(by: (HKUnit.pound().unitMultiplied(by: HKUnit.minute())))) //for vo2
        
        for unit in units {
            if self.is(compatibleWith: unit){
                return unit
            }
        }
        return nil
    }
}

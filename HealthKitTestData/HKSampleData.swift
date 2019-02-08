//
//  HKSampleData.swift
//  HealthKitTestData
//
//  Created by Ricky Kirkendall on 6/25/18.
//  Copyright © 2018 Ricky Kirkendall. All rights reserved.
//

import Foundation
import HealthKit
import SwiftDate
class HKSampleData {
    var sampleTypes = Set<HKSampleType>()
    let healthStore = HKHealthStore()
    func permission(successBlock:@escaping () -> Void) {
        healthStore.requestAuthorization(toShare: sampleTypes, read: sampleTypes) { (success, error) in
            if !success {

            } else {
                successBlock()
            }
        }
    }

    func getMostRecentSample(for sampleType: HKSampleType,
                             completion: @escaping (HKQuantitySample?, Error?) -> Swift.Void) {

        //1. Use HKQuery to load the most recent samples.
        let mostRecentPredicate = HKQuery.predicateForSamples(withStart: Date.distantPast,
                                                              end: Date(),
                                                              options: .strictEndDate)

        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate,
                                              ascending: false)

        let limit = 1

        let sampleQuery = HKSampleQuery(sampleType: sampleType,
                                        predicate: mostRecentPredicate,
                                        limit: limit,
                                        sortDescriptors: [sortDescriptor]) { (query, samples, error) in

                                            //2. Always dispatch to the main thread when complete.
                                            DispatchQueue.main.async {

                                                guard let samples = samples,
                                                    let mostRecentSample = samples.first as? HKQuantitySample else {

                                                        completion(nil, error)
                                                        return
                                                }

                                                completion(mostRecentSample, nil)
                                            }
        }

        HKHealthStore().execute(sampleQuery)
    }

    func writeData() {
        //1.  Make sure the body mass type exists
        guard let bodyMassIndexType = HKQuantityType.quantityType(forIdentifier: .bodyMassIndex) else {
            fatalError("Body Mass Index Type is no longer available in HealthKit")
        }

        //2.  Use the Count HKUnit to create a body mass quantity
        let bodyMassQuantity = HKQuantity(unit: HKUnit.count(),
                                          doubleValue: 21.5)

        let bodyMassIndexSample = HKQuantitySample(type: bodyMassIndexType,
                                                   quantity: bodyMassQuantity,
                                                   start: Date(),
                                                   end: Date())

        //3.  Save the same to HealthKit
        HKHealthStore().save(bodyMassIndexSample) { (success, error) in

            if let error = error {
                print("Error Saving BMI Sample: \(error.localizedDescription)")
            } else {
                print("Successfully saved BMI Sample")
            }
        }
    }

    /*
     Ranges for:
     
     Blood pressure
     BMI
     Heart Rate
     Oxygen Saturation
     Temperature
     Weight (Body Mass)
     
     */

    func randomDoubleBetween(lower: Int, upper: Int) -> Double {
        let diff = upper-lower
        let randDiff = Double(arc4random_uniform(UInt32(diff))+1)
        return Double(upper) - Double(randDiff)
    }

    func implementRanges(sample: HKQuantitySample) -> HKQuantitySample {
        if  sample.quantityType.identifier == "HKQuantityTypeIdentifierBloodPressureDiastolic"{
            let randomValue = randomDoubleBetween(lower: 110, upper: 160)
            let hkQuantity = HKQuantity(unit: HKUnit.millimeterOfMercury(), doubleValue: randomValue)
            return HKQuantitySample(type: sample.quantityType, quantity: hkQuantity, start: sample.startDate, end: sample.endDate)
        } else if sample.quantityType.identifier == "HKQuantityTypeIdentifierBloodPressureSystolic"{
            let randomValue = randomDoubleBetween(lower: 70, upper: 120)
            let hkQuantity = HKQuantity(unit: HKUnit.millimeterOfMercury(), doubleValue: randomValue)
            return HKQuantitySample(type: sample.quantityType, quantity: hkQuantity, start: sample.startDate, end: sample.endDate)
        } else if sample.quantityType.identifier == "HKQuantityTypeIdentifierBodyMassIndex"{
            let randomValue = randomDoubleBetween(lower: 18, upper: 25)
            let hkQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: randomValue)
            return HKQuantitySample(type: sample.quantityType, quantity: hkQuantity, start: sample.startDate, end: sample.endDate)
        } else if sample.quantityType.identifier == "HKQuantityTypeIdentifierHeartRate"{
            let randomValue = randomDoubleBetween(lower: 60, upper: 120)
            let hkQuantity = HKQuantity(unit: HKUnit.count().unitDivided(by: HKUnit.minute()), doubleValue: randomValue)
            return HKQuantitySample(type: sample.quantityType, quantity: hkQuantity, start: sample.startDate, end: sample.endDate)
        } else if sample.quantityType.identifier == "HKQuantityTypeIdentifierOxygenSaturation"{
            let randomValue = randomDoubleBetween(lower: 95, upper: 100)
            let hkQuantity = HKQuantity(unit: HKUnit.percent(), doubleValue: randomValue)
            return HKQuantitySample(type: sample.quantityType, quantity: hkQuantity, start: sample.startDate, end: sample.endDate)
        } else if sample.quantityType.identifier == "HKQuantityTypeIdentifierBodyMass"{
            let randomValue = randomDoubleBetween(lower: 110, upper: 310)
            let hkQuantity = HKQuantity(unit: HKUnit.pound(), doubleValue: randomValue)
            return HKQuantitySample(type: sample.quantityType, quantity: hkQuantity, start: sample.startDate, end: sample.endDate)
        } else if sample.quantityType.identifier == "HKQuantityTypeIdentifierBodyTemperature"{
            let randomValue = randomDoubleBetween(lower: 97, upper: 104)
            let hkQuantity = HKQuantity(unit: HKUnit.degreeFahrenheit(), doubleValue: randomValue)
            return HKQuantitySample(type: sample.quantityType, quantity: hkQuantity, start: sample.startDate, end: sample.endDate)
        }

        return sample
    }

    func writeDataSince(since: Date, quantityTypeMap: [HKQuantityType: HKUnit]) {
        var iterdate = since

        while iterdate <= Date() {
            // Add samples for day
            for hkObjType in self.sampleTypes {
                if hkObjType.isKind(of: HKQuantityType.self) {
                    guard let quantType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier(rawValue: hkObjType.identifier)) else {
                        fatalError("Quantity could not be set")
                    }

                    var unit: HKUnit
                    if quantityTypeMap[quantType] != nil {
                        unit = quantityTypeMap[quantType]!
                    } else if quantType.compatibleUnit() != nil {
                        unit = quantType.compatibleUnit()!
                    } else {
                        fatalError("Compatible HKUnit not found for \(quantType.identifier)")
                    }

                    let rand = Double(arc4random_uniform(100)+1)
                    let quantity = HKQuantity(unit: unit, doubleValue: rand)

                    var sample: HKQuantitySample

                    if quantType.identifier == "HKQuantityTypeIdentifierInsulinDelivery"{
                        sample = HKQuantitySample(type: quantType, quantity: quantity, start: iterdate, end: iterdate, metadata:  [HKMetadataKeyInsulinDeliveryReason: NSNumber(integerLiteral: HKInsulinDeliveryReason.basal.rawValue)])
                    } else {
                        sample = HKQuantitySample(type: quantType,
                                         quantity: quantity,
                                         start: iterdate,
                                         end: iterdate)
                    }
                    print(quantType.identifier)

                    sample = implementRanges(sample: sample)

                    healthStore.save(sample) { (success, error) in
                        if let error = error {
                            print("Error saving quant sample: \(error.localizedDescription)")
                        } else {
                            print("Successfully saved category sample")
                        }
                    }
                } else if hkObjType.isKind(of: HKCategoryType.self) {
                    guard let catType = HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier(rawValue: hkObjType.identifier)) else {
                        fatalError("Category could not be set")
                    }

                    // value has to be from the appropriate enum value
                    var sample: HKCategorySample
                    if catType.identifier == "HKCategoryTypeIdentifierCervicalMucusQuality"{
                        //todo vary this
                        sample = HKCategorySample(type: catType, value: HKCategoryValueCervicalMucusQuality.creamy.rawValue, start: iterdate, end: iterdate)
                    } else if catType.identifier == "HKCategoryTypeIdentifierIntermenstrualBleeding"
                        || catType.identifier == "HKCategoryTypeIdentifierMindfulSession"{
                        sample = HKCategorySample(type: catType, value: HKCategoryValue.notApplicable.rawValue, start: iterdate, end: iterdate)
                    } else if catType.identifier == "HKCategoryTypeIdentifierMenstrualFlow"{
                        //todo vary this
                        sample = HKCategorySample(type: catType, value: HKCategoryValueMenstrualFlow.heavy.rawValue, start: iterdate, end: iterdate, metadata: [HKMetadataKeyMenstrualCycleStart: true])
                    } else if catType.identifier == "HKCategoryTypeIdentifierOvulationTestResult"{
                        // todo vary this
                        sample = HKCategorySample(type: catType, value: HKCategoryValueOvulationTestResult.indeterminate.rawValue, start: iterdate, end: iterdate)
                    } else if catType.identifier == "HKCategoryTypeIdentifierSexualActivity"{
                        sample = HKCategorySample(type: catType, value: HKCategoryValue.notApplicable.rawValue, start: iterdate, end: iterdate, metadata: [HKMetadataKeySexualActivityProtectionUsed: false])
                    } else { //if catType.identifier == "HKCategoryTypeSleepAnalysis"{
                        // todo vary this
                        sample = HKCategorySample(type: catType, value: HKCategoryValueSleepAnalysis.inBed.rawValue, start: iterdate, end: iterdate)
                    }

                    healthStore.save(sample) { (success, error) in
                        if let error = error {
                            print("Error saving category sample: \(error.localizedDescription)")
                        } else {
                            print("Successfully saved category sample")
                        }
                    }
                }
            }

            iterdate = iterdate.add(components: [.day: 1])
        }
    }

    func writeDataSince(since: Date) {
        // swiftlint:disable:next force_cast
        healthStore.preferredUnits(for: self.sampleTypes as! Set<HKQuantityType>) { (quantityTypeMap, error) in
            self.writeDataSince(since: since, quantityTypeMap: quantityTypeMap)
        }
    }
}

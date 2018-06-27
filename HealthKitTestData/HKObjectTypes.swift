//
//  HKObjectTypes.swift
//  HealthKitTestData
//
//  Created by Ricky Kirkendall on 6/27/18.
//  Copyright © 2018 Ricky Kirkendall. All rights reserved.
//

import Foundation
import HealthKit

struct HKObjectTypes{
    let characteristicTypes = Set([HKObjectType.characteristicType(forIdentifier: .biologicalSex)!,
                                   HKObjectType.characteristicType(forIdentifier: .bloodType)!,
                                   HKObjectType.characteristicType(forIdentifier: .dateOfBirth)!,
                                   HKObjectType.characteristicType(forIdentifier: .fitzpatrickSkinType)!,
                                   HKObjectType.characteristicType(forIdentifier: .wheelchairUse)!,
                                   ])
    
    let categoryTypes = Set([HKObjectType.categoryType(forIdentifier: .cervicalMucusQuality)!,
                             HKObjectType.categoryType(forIdentifier: .intermenstrualBleeding)!,
                             HKObjectType.categoryType(forIdentifier: .menstrualFlow)!,
                             HKObjectType.categoryType(forIdentifier: .mindfulSession)!,
                             HKObjectType.categoryType(forIdentifier: .ovulationTestResult)!,
                             HKObjectType.categoryType(forIdentifier: .sexualActivity)!,
                             HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!,
                             ])
    
    
    let quantityTypes = Set([HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
                             HKObjectType.quantityType(forIdentifier: .basalEnergyBurned)!,
                             HKObjectType.quantityType(forIdentifier: .basalBodyTemperature)!,
                             HKObjectType.quantityType(forIdentifier: .bloodAlcoholContent)!,
                             HKObjectType.quantityType(forIdentifier: .bloodGlucose)!,
                             HKObjectType.quantityType(forIdentifier: .bloodPressureSystolic)!,
                             HKObjectType.quantityType(forIdentifier: .bloodPressureDiastolic)!,
                             HKObjectType.quantityType(forIdentifier: .bodyFatPercentage)!,
                             HKObjectType.quantityType(forIdentifier: .bodyMass)!,
                             HKObjectType.quantityType(forIdentifier: .bodyMassIndex)!,
                             HKObjectType.quantityType(forIdentifier: .bodyTemperature)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryBiotin)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryCaffeine)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryCalcium)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryCarbohydrates)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryChloride)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryCholesterol)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryChromium)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryCopper)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryEnergyConsumed)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryFatMonounsaturated)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryFatPolyunsaturated)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryFatSaturated)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryFatTotal)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryFiber)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryFolate)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryIodine)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryIron)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryMagnesium)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryManganese)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryMolybdenum)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryNiacin)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryPantothenicAcid)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryPhosphorus)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryPotassium)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryProtein)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryRiboflavin)!,
                             HKObjectType.quantityType(forIdentifier: .dietarySelenium)!,
                             HKObjectType.quantityType(forIdentifier: .dietarySodium)!,
                             HKObjectType.quantityType(forIdentifier: .dietarySugar)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryThiamin)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryVitaminA)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryVitaminB12)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryVitaminB6)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryVitaminC)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryVitaminD)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryVitaminE)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryVitaminK)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryWater)!,
                             HKObjectType.quantityType(forIdentifier: .dietaryZinc)!,
                             HKObjectType.quantityType(forIdentifier: .distanceCycling)!,
                             HKObjectType.quantityType(forIdentifier: .distanceDownhillSnowSports)!,
                             HKObjectType.quantityType(forIdentifier: .distanceSwimming)!,
                             HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!,
                             HKObjectType.quantityType(forIdentifier: .distanceWheelchair)!,
                             HKObjectType.quantityType(forIdentifier: .electrodermalActivity)!,
                             HKObjectType.quantityType(forIdentifier: .flightsClimbed)!,
                             HKObjectType.quantityType(forIdentifier: .forcedExpiratoryVolume1)!,
                             HKObjectType.quantityType(forIdentifier: .forcedVitalCapacity)!,
                             HKObjectType.quantityType(forIdentifier: .heartRate)!,
                             HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN)!,
                             HKObjectType.quantityType(forIdentifier: .height)!,
                             HKObjectType.quantityType(forIdentifier: .inhalerUsage)!,
                             HKObjectType.quantityType(forIdentifier: .insulinDelivery)!,
                             HKObjectType.quantityType(forIdentifier: .leanBodyMass)!,
                             HKObjectType.quantityType(forIdentifier: .numberOfTimesFallen)!,
                             HKObjectType.quantityType(forIdentifier: .oxygenSaturation)!,
                             HKObjectType.quantityType(forIdentifier: .peakExpiratoryFlowRate)!,
                             HKObjectType.quantityType(forIdentifier: .peripheralPerfusionIndex)!,
                             HKObjectType.quantityType(forIdentifier: .pushCount)!,
                             HKObjectType.quantityType(forIdentifier: .respiratoryRate)!,
                             HKObjectType.quantityType(forIdentifier: .restingHeartRate)!,
                             HKObjectType.quantityType(forIdentifier: .stepCount)!,
                             HKObjectType.quantityType(forIdentifier: .swimmingStrokeCount)!,
                             HKObjectType.quantityType(forIdentifier: .uvExposure)!,
                             HKObjectType.quantityType(forIdentifier: .vo2Max)!,
                             HKObjectType.quantityType(forIdentifier: .waistCircumference)!,
                             HKObjectType.quantityType(forIdentifier: .walkingHeartRateAverage)!,
                             ])
    
    let nonsharables = Set([HKObjectType.quantityType(forIdentifier: .walkingHeartRateAverage)!,
                            //HKObjectType.quantityType(forIdentifier: .distanceDownhillSnowSports)!,
                            //HKObjectType.quantityType(forIdentifier: .peripheralPerfusionIndex)!,
                            //HKObjectType.quantityType(forIdentifier: .oxygenSaturation)!,
                            ])
    let writables: Set<HKSampleType>
    let readables: Set<HKObjectType>
    init() {
        writables = Set().union(quantityTypes).union(categoryTypes).subtracting(nonsharables)
        readables = Set().union(characteristicTypes).union(quantityTypes).union(categoryTypes)
    }    
    
}

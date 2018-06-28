# heal-healthkit-generator

This is a small project for generating sample data within HealthKit on an iOS Simulator. 

## Setup
1. Run `pod install` and open the created workspace
2. Inside `ViewController.swift`, set `sampleData.sampleTypes` to the Set of sample types that you would like to generate random data for. The project includes an `HKOBjectTypes` file which contains a Set of all sharable HealthKit sample types.
3. Inside `ViewController.swift`, set `sampleData.writeDataSince` to the length of time would like to generate data for.
3. Run the project, allow the app permission for all sample types and the app will begin populating HealthKit

Please note that this generator uses random numbers from 1 - 100. The data WILL look weird in HealthKit. We're hoping to implmement sensible ranges for each quantity type in the future.


//
//  AppDelegate.swift
//  JPLearningiOS
//
//  Created by Numasawa, Moe on 2024-07-14.
//

import UIKit
import Firebase // Import Firebase framework

//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure() // Configure Firebase
        
        // Call readCSV for each CSV file you want to load
        readCSV(from: "Vocab.csv", modelType: Vocab.self) { success in
            if success {
                print("Vocab data loaded successfully")
            } else {
                print("Failed to load Vocab data")
            }
        }
        readCSV(from: "AdditionalVocab.csv", modelType: AdditionalVocab.self) { success in
            if success {
                print("AdditionalVocab data loaded successfully")
            } else {
                print("Failed to load AdditionalVocab data")
            }
        }
        readCSV(from: "Structure.csv", modelType: Structure.self) { success in
            if success {
                print("Structure data loaded successfully")
            } else {
                print("Failed to load Structure data")
            }
        }
        readCSV(from: "VocabExample.csv", modelType: VocabExample.self) { success in
            if success {
                print("VocabExample data loaded successfully")
            } else {
                print("Failed to load VocabExample data")
            }
        }

        
        return true
    }
}

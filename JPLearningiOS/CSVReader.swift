//
//  CSVReader.swift
//  JPLearningiOS
//
//  Created by Numasawa, Moe on 2024-07-14.
//

import Foundation
import SwiftCSV
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage

// Function to download CSV from Firebase Storage
func downloadCSV(from path: String, completion: @escaping (URL?) -> Void) {
    let storage = Storage.storage()
    let storageRef = storage.reference().child(path)
    
    let localURL = FileManager.default.temporaryDirectory.appendingPathComponent(path)
    
    storageRef.write(toFile: localURL) { url, error in
        if let error = error {
            print("Error downloading CSV: \(error)")
            completion(nil)
        } else {
            completion(localURL)
        }
    }
}

// Utility function to read CSV and store data locally
func readCSV<T: Codable & Identifiable>(from path: String, modelType: T.Type, completion: @escaping (Bool) -> Void) {
    downloadCSV(from: path) { localURL in
        guard let localURL = localURL else {
            completion(false)
            return
        }
        
        do {
            let csv = try CSV<Named>(url: localURL)
            var items: [T] = []
            for row in csv.rows {
                if let instance = createModelInstance(from: row, modelType: modelType) {
                    items.append(instance)
                }
            }
            
            // Store fetched data in DataManager
            switch modelType {
            case is Vocab.Type:
                DataManager.shared.vocabList = items as! [Vocab]
            case is AdditionalVocab.Type:
                DataManager.shared.additionalVocabList = items as! [AdditionalVocab]
            case is Structure.Type:
                DataManager.shared.structureList = items as! [Structure]
            case is VocabExample.Type:
                DataManager.shared.vocabExampleList = items as! [VocabExample]
            default:
                print("Unsupported model type")
            }
            completion(true)
        } catch {
            print("Error reading CSV file: \(error)")
            completion(false)
        }
    }
}

// Utility function to create a model instance from a dictionary (CSV row)
func createModelInstance<T: Codable & Identifiable>(from row: [String: String], modelType: T.Type) -> T? {
    let jsonData = try? JSONSerialization.data(withJSONObject: row)
    return try? JSONDecoder().decode(modelType, from: jsonData!)
}

// Utility function to add a model instance to Firestore
func addToFirestore<T: Codable & Identifiable>(_ instance: T, collectionName: String) {
    let db = Firestore.firestore()
    
    do {
        try db.collection(collectionName).document(instance.id as? String ?? UUID().uuidString).setData(from: instance)
    } catch let error {
        print("Error writing to Firestore: \(error)")
    }
}

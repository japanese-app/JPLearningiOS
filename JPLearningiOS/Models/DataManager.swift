//
//  DataManager.swift
//  JPLearningiOS
//
//  Created by Numasawa, Moe on 2024-07-22.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    var vocabList: [Vocab] = []
    var additionalVocabList: [AdditionalVocab] = []
    var structureList: [Structure] = []
    var vocabExampleList: [VocabExample] = []
    
    private init() {}
}

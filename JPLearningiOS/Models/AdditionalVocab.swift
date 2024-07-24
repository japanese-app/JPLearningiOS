//
//  AdditionalVocab.swift
//  JPLearningiOS
//
//  Created by Numasawa, Moe on 2024-07-14.
//

import Foundation
import FirebaseFirestoreSwift

struct AdditionalVocab: Identifiable, Codable {
    @DocumentID var id: String?
    var wordJP: String
    var wordEN: String
    var explanation: String
    var examples: [[String: String]] // Array of dictionary with sentenceJP and sentenceEN
}

//
//  Vocab.swift
//  JPLearningiOS
//
//  Created by Numasawa, Moe on 2024-07-14.
//

import Foundation
import FirebaseFirestoreSwift

struct Vocab: Identifiable, Codable {
    @DocumentID var id: String?
    var wordJP: String
    var wordEN: String
    var explanation: String
    var structure: String
    var otherStructures: [String] // Array of Structure ids
    var level: String
    var relatedVerbForms: [String] // Array of Vocab ids
    var vocabExamples: [String] // Array of VocabExample ids
    var note: String? // User-specific field
    var isBookmark: Bool? // User-specific field
}

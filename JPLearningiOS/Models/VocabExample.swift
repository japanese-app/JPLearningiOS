//
//  VocabExample.swift
//  JPLearningiOS
//
//  Created by Numasawa, Moe on 2024-07-14.
//

import Foundation
import FirebaseFirestoreSwift

struct VocabExample: Identifiable, Codable {
    @DocumentID var id: String?
    var sentenceJP: String
    var sentenceEN: String
    var context: String
    var vocabs: [String] // Array of Vocab ids
    var additionalVocabs: [String] // Array of AdditionalVocab ids
    var audio: String // URL to MP3 file
    var note: String? // User-specific field
    var isBookmark: Bool? // User-specific field
}

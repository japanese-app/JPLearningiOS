//
//  Structure.swift
//  JPLearningiOS
//
//  Created by Numasawa, Moe on 2024-07-14.
//

import Foundation
import FirebaseFirestoreSwift

struct Structure: Identifiable, Codable {
    @DocumentID var id: String?
    var structure: String
    var examples: [[String: String]] // Array of dictionary with sentenceJP and sentenceEN
}

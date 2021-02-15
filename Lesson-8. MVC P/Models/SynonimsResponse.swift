//
//  SynonimsResponse.swift
//  Lesson-8. MVC P
//
//  Created by Alikhan Tuxubayev on 15.02.2021.
//

import Foundation



struct WordnikResponse: Decodable {
    var relationshipType: String
    var words: [String]
}

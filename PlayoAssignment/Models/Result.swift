//
//  Result.swift
//  PlayoAssignment
//
//  Created by Mac Nirman on 5/14/22.
//

import Foundation


struct Result: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}


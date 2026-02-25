//
//  Scholarship.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//


import Foundation

struct Scholarship: Identifiable, Codable {
    let id: UUID
    let name: String
    let country: String?
    let level: String?
    let deadline: String?
}

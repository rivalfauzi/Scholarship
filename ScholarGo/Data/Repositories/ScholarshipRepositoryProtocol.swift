//
//  ScholarshipRepositoryProtocol.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//


import Foundation

protocol ScholarshipRepositoryProtocol {
    func fetchScholarships() async throws -> [Scholarship]
}

final class ScholarshipRepository: ScholarshipRepositoryProtocol {
    
    private let remote = ScholarshipRemoteDataSource()
    
    func fetchScholarships() async throws -> [Scholarship] {
        return try await remote.fetchScholarships()
    }
}
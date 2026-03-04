//
//  ScholarshipServices.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//


import Foundation
import Supabase

class ScholarshipServices: BaseService, ScholarshipServicesProtocol {
    func fetchScholarships() async throws -> [Scholarship] {
        try await client
            .from("scholarships")
            .select()
            .execute()
            .value
    }
}

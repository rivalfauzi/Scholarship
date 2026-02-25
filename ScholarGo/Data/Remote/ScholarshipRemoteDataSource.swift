//
//  ScholarshipRemoteDataSource.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//


import Foundation
import Supabase

final class ScholarshipRemoteDataSource {
    
    private let client = SupabaseClientProvider.shared.client
    
    func fetchScholarships() async throws -> [Scholarship] {
        try await client
            .from("scholarships")
            .select()
            .execute()
            .value
    }
}

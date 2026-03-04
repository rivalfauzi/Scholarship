//
//  ScholarshipServicesProtocol.swift
//  Scholarships
//
//  Created by Rival Fauzi on 28/02/26.
//

import Foundation

protocol ScholarshipServicesProtocol {
    func fetchScholarships() async throws -> [Scholarship]
}

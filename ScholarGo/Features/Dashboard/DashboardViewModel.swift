//
//  DashboardViewModel.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//


import Foundation
import Combine

class DashboardViewModel: ObservableObject {
    
    @Published var scholarships: [Scholarship] = []
    @Published var isLoading = false
    
    private let repository: ScholarshipRepositoryProtocol
    
    init() {
        self.repository = ScholarshipRepository()
    }
    
    func loadScholarships() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            scholarships = try await repository.fetchScholarships()
        } catch {
            print("Error fetching scholarships:", error)
        }
    }
}

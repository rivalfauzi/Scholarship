//
//  DashboardViewModel.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//


import Foundation
import Combine

class DashboardViewModel: ObservableObject {
    let scholarshipServices: ScholarshipServices
    let navigate: (MainRoute) -> Void

    init(
        _ scholarshipServices: ScholarshipServices,
        navigate: @escaping (MainRoute) -> Void = { _ in }
    ) {
        self.scholarshipServices = scholarshipServices
        self.navigate = navigate
    }
    
    @Published var scholarships: [Scholarship] = []
    @Published var isLoading = false
    
    func loadScholarships() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            scholarships = try await scholarshipServices.fetchScholarships()
        } catch {
            print("Error fetching scholarships:", error)
        }
    }
}

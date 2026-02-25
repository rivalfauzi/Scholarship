//
//  DashboardView.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//

import SwiftUI

struct DashboardView: View {
    
    @ObservedObject var viewModel: DashboardViewModel
    
    var body: some View {
        NavigationStack {
            List(viewModel.scholarships) { scholarship in
                VStack(alignment: .leading) {
                    Text(scholarship.name)
                        .font(.headline)
                    
                    Text(scholarship.country ?? "")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Scholarships")
            .task {
                await viewModel.loadScholarships()
            }
        }
    }
}

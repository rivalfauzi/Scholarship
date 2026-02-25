//
//  DashboardCoordinator.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//

import SwiftUI
import Combine

class DashboardCoordinator: ObservableObject {
    @Published var viewModel = DashboardViewModel()
    
    func view() -> some View {
        DashboardView(viewModel: viewModel)
    }
}

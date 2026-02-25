//
//  ApplicationsCoordinator.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//

import SwiftUI
import Combine

class ApplicationsCoordinator: ObservableObject {
    @Published var viewModel = ApplicationsViewModel()
    
    func view() -> some View {
        ApplicationsView(viewModel: viewModel)
    }
}

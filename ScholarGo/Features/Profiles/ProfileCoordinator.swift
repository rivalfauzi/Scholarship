//
//  ProfileCoordinator.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//

import SwiftUI
import Combine

enum ProfileAction {
    case logout
}

class ProfileCoordinator: ObservableObject {
    @Published var viewModel = ProfileViewModel()
    
    private let successLogout: () -> Void
    
    init(successLogout: @escaping () -> Void) {
        self.successLogout = successLogout
    }
    
    func view() -> some View {
        ProfileView(viewModel: viewModel) {[weak self] action in
            guard let self else { return }
            self.handle(action)
        }
    }
    
    private func handle(_ action: ProfileAction) {
        switch action {
        case .logout:
            self.successLogout()
        }
    }
}

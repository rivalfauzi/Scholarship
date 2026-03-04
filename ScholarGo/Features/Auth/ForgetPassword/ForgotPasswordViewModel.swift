//
//  ForgotPasswordViewModel.swift
//  Scholarships
//
//  Created by Rival Fauzi on 28/02/26.
//

import Combine

final class ForgotPasswordViewModel: ObservableObject {
    private let authService = AuthService.shared
    let navigate: (AuthRoute) -> Void
    
    init(navigate: @escaping (AuthRoute) -> Void = { _ in }) {
        self.navigate = navigate
    }
}

//
//  SignUpViewModel.swift
//  Scholarships
//
//  Created by Rival Fauzi on 21/02/26.
//

import SwiftUI
import Combine

class SignupViewModel: ObservableObject {
    private let authService = AuthService.shared
    let navigate: (AuthRoute) -> Void
    
    init(navigate: @escaping (AuthRoute) -> Void = { _ in }) {
        self.navigate = navigate
    }
    
}

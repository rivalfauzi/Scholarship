//
//  LoginViewModel.swift
//  Scholarships
//
//  Created by Rival Fauzi on 21/02/26.
//

import SwiftUI
import Combine

final class LoginViewModel: ObservableObject {
    private let authService = AuthService.shared
    let navigate: (AuthRoute) -> Void
    
    init(navigate: @escaping (AuthRoute) -> Void = { _ in }) {
        self.navigate = navigate
    }
    
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    
    func loginTapped() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("Email dan password wajib diisi")
            return
        }
        
        isLoading = true
        defer { isLoading = false }
        
        do {
            try await authService.login(email: email, password: password)
        } catch {
            print(error.localizedDescription)
        }
    }
    
//    func signupTapped() {
//        subject.send(.navigateToSignup)
//    }
//    
//    func forgotTapped() {
//        subject.send(.navigateToForgotPassword)
//    }
}

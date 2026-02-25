//
//  LoginViewModel.swift
//  Scholarships
//
//  Created by Rival Fauzi on 21/02/26.
//

import SwiftUI
import Combine

final class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    @Published var isLoading = false
    
    private let authService = AuthService()
    private weak var coordinator: AuthCoordinator?
    private let onFinish: () -> Void
    
    init(coordinator: AuthCoordinator,
         onFinish: @escaping () -> Void) {
        self.coordinator = coordinator
        self.onFinish = onFinish
    }
    
    func loginTapped() {
        onFinish()
    }
    
    func signUpTapped() {
        coordinator?.path.append(AuthRoute.signUp)
    }
    
    func forgotPasswordTapped() {
        coordinator?.path.append(AuthRoute.forgotPassword)
    }
    
    func login() async throws {
        
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Email dan password wajib diisi"
            return
        }
        
        isLoading = true
        defer { isLoading = false }
        
        do {
            try await authService.signIn(email: email, password: password)
            self.loginTapped()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

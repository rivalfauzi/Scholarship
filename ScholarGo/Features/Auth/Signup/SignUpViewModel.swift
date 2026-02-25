//
//  SignUpViewModel.swift
//  Scholarships
//
//  Created by Rival Fauzi on 21/02/26.
//

import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    private let authService = AuthService()
    private weak var coordinator: AuthCoordinator?
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    init(coordinator: AuthCoordinator) {
        self.coordinator = coordinator
    }
    
    func signUp() async {
        guard !email.isEmpty, !password.isEmpty, password == confirmPassword else { return }
        
        do {
            try await authService.sendMagicLink(to: email)
            coordinator?.path.removeLast()
        } catch {
            print(error.localizedDescription)
        }
    }
}

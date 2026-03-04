//
//  AuthCoordinatorView.swift
//  Scholarships
//
//  Created by Rival Fauzi on 21/02/26.
//

import SwiftUI

struct AuthCoordinatorView: View {
    @StateObject private var router = AuthRouter()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            LoginView(
                viewModel: LoginViewModel(
                    navigate: router.push
                )
            )
            .navigationDestination(for: AuthRoute.self) { route in
                build(route)
            }
        }
    }
    
    @ViewBuilder
    private func build(_ route: AuthRoute) -> some View {
        switch route {
        case .signUp:
            SignUpView(viewModel: SignupViewModel())
        case .forgotPassword:
            ForgotPasswordView(viewModel: ForgotPasswordViewModel())
        }
    }
}

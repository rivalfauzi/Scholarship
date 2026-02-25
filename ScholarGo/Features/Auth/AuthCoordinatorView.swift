//
//  AuthCoordinatorView.swift
//  Scholarships
//
//  Created by Rival Fauzi on 21/02/26.
//

import SwiftUI

struct AuthCoordinatorView: View {
    
    @StateObject var coordinator: AuthCoordinator
    var onFinish: () -> Void
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            build(.login)
                .navigationDestination(for: AuthRoute.self) { route in
                    build(route)
                }
        }
    }
    
    @ViewBuilder
    private func build(_ route: AuthRoute) -> some View {
        switch route {
        case .login:
            LoginView(
                viewModel: LoginViewModel(
                    coordinator: coordinator,
                    onFinish: onFinish
                )
            )
            
        case .signUp:
            SignUpView(
//                viewModel: SignUpViewModel(coordinator: coordinator)
            )
            
        case .forgotPassword:
//            ForgotPasswordView(
//                viewModel: ForgotPasswordViewModel(coordinator: coordinator)
//            )
            EmptyView()
        }
    }
}

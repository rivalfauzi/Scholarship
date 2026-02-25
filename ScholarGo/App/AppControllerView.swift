//
//  AppControllerView.swift
//  Scholarships
//
//  Created by MCO on 19/02/26.
//


import SwiftUI

struct AppControllerView: View {
    
    @StateObject private var controller = AppController()
    
    var body: some View {
        Group {
            switch controller.state {
            case .loading:
                SplashView()
            case .authenticated:
                MainController {
                    controller.state = .unauthenticated
                }.view()
            case .unauthenticated:
                AuthCoordinator().start {
                    controller.state = .authenticated
                }
            }
        }
        .onOpenURL { url in
            Task {
                try? await AuthService().handleDeepLink(url)
                await controller.checkSession()
            }
        }
        .task {
            await controller.checkSession()
        }
    }
}

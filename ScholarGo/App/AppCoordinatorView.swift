//
//  AppCoordinatorView.swift
//  Scholarships
//
//  Created by MCO on 19/02/26.
//


import SwiftUI

struct AppCoordinatorView: View {
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some View {
        Group {
            switch coordinator.flow {
            case .loading:
                SplashView()
            case .auth:
                AuthCoordinatorView()
            case .main:
                MainCoordinatorView()
            }
        }
        .onOpenURL { url in
            Task {
                await coordinator.handleDeeplink(url)
            }
        }
        .task {
            await coordinator.bootstrap()
        }
    }
}

//
//  AppCoordinator.swift
//  Scholarships
//
//  Created by MCO on 19/02/26.
//


import SwiftUI
import Combine
import Auth

@MainActor
final class AppCoordinator: ObservableObject {
    @Published var flow: AppFlow = .loading
    
    init() {
        obeserveAuth()
    }
    
    private let authServices = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    private func obeserveAuth() {
        AuthService.shared.$session
            .sink { [weak self] session in
                self?.flow = session == nil ? .auth : .main
            }
            .store(in: &cancellables)
    }
    
    func bootstrap() async {
        await AuthService.shared.bootstrap()
    }
    
    func checkSession() async {
        guard let session = await authServices.currentSession(), !session.isExpired else {
            flow = .auth
            return
        }
        flow = .main
    }
    
    func handleDeeplink(_ url: URL) async {
        try? await authServices.handleDeepLink(url)
        await checkSession()
    }
}


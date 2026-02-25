//
//  AppController.swift
//  Scholarships
//
//  Created by MCO on 19/02/26.
//


import SwiftUI
import Combine
import Auth

enum AppState {
    case loading
    case authenticated
    case unauthenticated
}

final class AppController: ObservableObject {
    
    @Published var state: AppState = .loading
    
    private let authService = AuthService()
    
    func checkSession() async {
        guard let session = await authService.currentSession(), !session.isExpired else {
            state = .unauthenticated
            return
        }
        
        state = .authenticated
    }
}

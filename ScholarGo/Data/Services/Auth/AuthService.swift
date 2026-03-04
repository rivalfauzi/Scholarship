//
//  AuthService.swift
//  Scholarships
//
//  Created by MCO on 19/02/26.
//

import Combine
import Foundation
import Supabase

class AuthService: BaseService, ObservableObject {
    @Published private(set) var session: Session?
    
    static let shared = AuthService()
    
    func bootstrap() async {
        session = try? await client.auth.session
    }
}

extension AuthService: AuthServiceProtocol {
    func login(email: String, password: String) async throws {
        try await client.auth.signIn(
            email: email,
            password: password
        )
        
        session = try? await client.auth.session
    }
    
    func logout() async throws {
        try await client.auth.signOut()
        session = nil
    }
    
    func sendMagicLink(to email: String) async throws {
        try await client.auth.signInWithOTP(
            email: email,
            redirectTo: URL(string: "scholargo://auth")
        )
    }
    
    func handleDeepLink(_ url: URL) async throws {
        try await client.auth.session(from: url)
        session = try? await client.auth.session
    }
    
    func currentSession() async -> Session? {
        try? await client.auth.session
    }
}

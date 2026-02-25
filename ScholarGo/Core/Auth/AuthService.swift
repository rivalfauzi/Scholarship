//
//  AuthService.swift
//  Scholarships
//
//  Created by MCO on 19/02/26.
//

import Foundation
import Supabase

final class AuthService {
    
    private let client = SupabaseClientProvider.shared.client
    
    func sendMagicLink(to email: String) async throws {
        try await client.auth.signInWithOTP(
            email: email,
            redirectTo: URL(string: "scholargo://auth")
        )
    }
    
    func signIn(email: String, password: String) async throws {
        try await client.auth.signIn(
            email: email,
            password: password
        )
    }
    
    func handleDeepLink(_ url: URL) async throws {
        try await client.auth.session(from: url)
    }
    
    func currentSession() async -> Session? {
        try? await client.auth.session
    }
    
    func signOut() async throws {
        try await client.auth.signOut()
    }
}

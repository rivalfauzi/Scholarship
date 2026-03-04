//
//  AuthServiceProtocol.swift
//  Scholarships
//
//  Created by Rival Fauzi on 28/02/26.
//

import Foundation
import Supabase

protocol AuthServiceProtocol {
    func login(email: String, password: String) async throws
    func logout() async throws
    func sendMagicLink(to email: String) async throws
    func handleDeepLink(_ url: URL) async throws
    func currentSession() async -> Session?
}

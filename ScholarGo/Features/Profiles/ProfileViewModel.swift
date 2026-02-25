//
//  ProfileViewModel.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    private let authService = AuthService()
    
    func logout() async -> Bool {
        do {
            try await authService.signOut()
            return true
        } catch {
            return false
        }
    }
}

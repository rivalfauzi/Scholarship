//
//  ProfileViewModel.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    private let authService = AuthService.shared
    
    func logout() async throws {
        do {
            try await authService.logout()
        } catch {
            print(error.localizedDescription)
        }
    }
}

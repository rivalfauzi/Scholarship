//
//  AppController.swift
//  Scholarships
//
//  Created by MCO on 19/02/26.
//


import SwiftUI
import Combine

final class AppController: ObservableObject {
    
    @Published var isAuthenticated: Bool = false
    
    func setAuthenticated(_ value: Bool) {
        isAuthenticated = value
    }
}

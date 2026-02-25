//
//  AppRoute.swift
//  Scholarships
//
//  Created by Rival Fauzi on 21/02/26.
//


import Foundation

enum AppRoute: Hashable {
    
    // Root Flow
    case auth
    case main
    
    // Auth Flow
    case login
    case register
    
    // Main Flow
    case home
    case courseDetail(id: String)
    case profile(userID: String)
}
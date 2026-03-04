//
//  MainCoordinator.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//

import SwiftUI
import Combine

final class MainCoordinator: ObservableObject {
    
    @Published var selectedTab: Tab = .dashboard
    
    enum Tab {
        case dashboard
        case applications
        case profile
        case search
        case document
    }
}

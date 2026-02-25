//
//  MainController.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//

import SwiftUI
import Combine

final class MainController: ObservableObject {
    
    @Published var selectedTab: Tab = .dashboard
    let onLogout: () -> Void
    
    let dashboardCoordinator = DashboardCoordinator()
    let applicationsCoordinator = ApplicationsCoordinator()
    let documentsCoordinator = DocumentsCoordinator()
    lazy var profileCoordinator: ProfileCoordinator = ProfileCoordinator {
        self.onLogout()
    }
    
    enum Tab {
        case dashboard
        case applications
        case profile
        case search
        case document
    }
    
    init(onLogout: @escaping () -> Void) {
        self.onLogout = onLogout
    }
    
    func view() -> some View {
        MainView(controller: self)
    }
}

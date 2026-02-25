//
//  AppRouter.swift
//  Scholarships
//
//  Created by Rival Fauzi on 21/02/26.
//


import SwiftUI
import Combine

final class AppRouter: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var root: AppRoute = .auth
    
    // MARK: - Navigation
    
    func push(_ route: AppRoute) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path = NavigationPath()
    }
    
    func switchRoot(to route: AppRoute) {
        path = NavigationPath()
        root = route
    }
}

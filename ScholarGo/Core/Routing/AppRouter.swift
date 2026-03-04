//
//  AppRouter.swift
//  Scholarships
//
//  Created by Rival Fauzi on 01/03/26.
//

import SwiftUI
import Combine

@MainActor
final class Router<Route: Hashable>: ObservableObject {
    
    @Published var path = NavigationPath()
    
    // MARK: - Basic
    
    func push(_ route: Route) {
        path.append(route)
    }
    
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    // MARK: - Advanced
    
    func popToRoot() {
        path = NavigationPath()
    }
    
    func replaceStack(with routes: [Route]) {
        var newPath = NavigationPath()
        routes.forEach { newPath.append($0) }
        path = newPath
    }
    
    func reset() {
        path = NavigationPath()
    }
}

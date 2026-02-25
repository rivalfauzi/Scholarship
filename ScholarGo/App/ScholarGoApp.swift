//
//  ScholarshipsApp.swift
//  Scholarships
//
//  Created by MCO on 19/02/26.
//

import SwiftUI

@main
struct ScholarGoApp: App {
    @StateObject private var router = AppRouter()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                AppControllerView()
            }
            .environmentObject(router)
        }
    }
}

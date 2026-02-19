//
//  AppControllerView.swift
//  Scholarships
//
//  Created by MCO on 19/02/26.
//


import SwiftUI

struct AppControllerView: View {
    
    @StateObject private var controller = AppController()
    
    var body: some View {
        Group {
            if controller.isAuthenticated {
                Text("Main Flow")
            } else {
                Text("Auth Flow")
            }
        }
    }
}

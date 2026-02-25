//
//  MainView.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//

import SwiftUI
import Combine

struct MainView: View {
    
    @ObservedObject var controller: MainController
    
    var body: some View {
        TabView(selection: $controller.selectedTab) {
            
            controller.dashboardCoordinator.view()
                .tabItem {
                    Label("Beranda", systemImage: "house")
                }
                .tag(MainController.Tab.dashboard)
            
            controller.applicationsCoordinator.view()
                .tabItem {
                    Label("Aplikasiku", systemImage: "doc.text")
                }
                .tag(MainController.Tab.applications)
            
            SearchView()
                .tabItem {
                    Label("Cari Beasiswa", systemImage: "magnifyingglass")
                }
                .tag(MainController.Tab.search)
            
            controller.documentsCoordinator.view()
                .tabItem {
                    Label("Dokumen", systemImage: "folder")
                }
                .tag(MainController.Tab.document)
            
            controller.profileCoordinator.view()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(MainController.Tab.profile)
        }
    }
}

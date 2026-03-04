//
//  MainView.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//

import SwiftUI
import Combine

struct MainCoordinatorView: View {
    @ObservedObject var coordinator = MainCoordinator()
    @StateObject private var router = MainRouter()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            TabView(selection: $coordinator.selectedTab) {
                DashboardView(viewModel: DashboardViewModel(ScholarshipServices(), navigate: router.push))
                    .tabItem {
                        Label("Beranda", systemImage: "house")
                    }
                    .tag(MainCoordinator.Tab.dashboard)
                
                ApplicationsView(viewModel: ApplicationsViewModel())
                    .tabItem {
                        Label("Aplikasiku", systemImage: "doc.text")
                    }
                    .tag(MainCoordinator.Tab.applications)
                
                SearchView()
                    .tabItem {
                        Label("Cari Beasiswa", systemImage: "magnifyingglass")
                    }
                    .tag(MainCoordinator.Tab.search)
                
                DocumentsView(viewModel: DocumentsViewModel())
                    .tabItem {
                        Label("Dokumen", systemImage: "folder")
                    }
                    .tag(MainCoordinator.Tab.document)
                
                ProfileView(viewModel: ProfileViewModel())
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
                    .tag(MainCoordinator.Tab.profile)
            }
            .navigationDestination(for: MainRoute.self) { route in
                build(route)
            }
        }
    }
    
    @ViewBuilder
    private func build(_ route: MainRoute) -> some View {
        switch route {
        case .roadmap(id: _):
            RoadmapView(viewModel: RoadmapViewModel())
        case .scholarshipDetail(id: _):
            EmptyView()
        }
    }
}

//
//  ProfileView.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        Button {
            Task {
                try? await viewModel.logout()
            }
        } label: {
            Text("Log out")
        }
        .buttonStyle(PrimaryButtonStyle())
    }
}

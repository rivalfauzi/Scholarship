//
//  ProfileView.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    let onAction: (ProfileAction) -> Void
    
    var body: some View {
        Button {
            Task {
                let success = await viewModel.logout()
                
                if success {
                    onAction(.logout)
                }
            }
        } label: {
            Text("Log out")
        }
        .buttonStyle(PrimaryButtonStyle())
    }
}

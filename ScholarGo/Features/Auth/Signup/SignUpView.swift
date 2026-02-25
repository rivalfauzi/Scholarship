//
//  SignUpView.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//


import SwiftUI

struct SignUpView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        ZStack {
            AppColor.background
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                headerSection
                
                signupCard
                    .padding(.horizontal, 24)
                    .offset(y: -40)
                
                Spacer()
            }
        }
    }
}

private extension SignUpView {
    
    var headerSection: some View {
        LinearGradient(
            colors: [AppColor.primary, AppColor.primary.opacity(0.8)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .frame(height: 250)
        .ignoresSafeArea()
    }
    
    var signupCard: some View {
        VStack(spacing: 20) {
            
            Text("Create Account")
                .font(AppFont.title)
                .foregroundColor(AppColor.textPrimary)
            
            VStack(spacing: 16) {
                AppTextField(
                    placeholder: "Email",
                    text: $email,
                    systemImage: "envelope"
                )
                
                AppSecureField(
                    placeholder: "Password",
                    text: $password,
                    systemImage: "lock"
                )
                
                AppSecureField(
                    placeholder: "Confirm Password",
                    text: $confirmPassword,
                    systemImage: "lock"
                )
            }
            
            Button("Sign Up") {
                // TODO: signup action
            }
            .buttonStyle(PrimaryButtonStyle())
        }
        .padding(24)
        .background(AppColor.surface)
        .cornerRadius(24)
        .shadow(color: .black.opacity(0.05), radius: 20, y: 10)
    }
}
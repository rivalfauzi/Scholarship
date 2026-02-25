//
//  LoginView.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//


import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    @State private var email = ""
    @State private var password = ""
    
//    var onAction: (AuthAction) -> Void
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            // MARK: - Background
            LinearGradient(colors: [AppColor.primary, AppColor.primary.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                // MARK: - Header Section
                headerSection
                
                // MARK: - Form Card
                loginCard
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

private extension LoginView {
    
    var headerSection: some View {
        ZStack(alignment: .bottomLeading) {
            
            LinearGradient(
                colors: [AppColor.primary, AppColor.primary.opacity(0.8)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 8) {
                
                Image(systemName: "graduationcap.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                
                Text("Welcome to Scholar Go")
                    .font(AppFont.title)
                    .foregroundColor(.white)
                
                Text("Unlock Your Future")
                    .font(AppFont.body)
                    .foregroundColor(.white.opacity(0.9))
            }
            .padding(24)
        }
    }
    
    var loginCard: some View {
        VStack(spacing: 24) {
            HStack(){
                Text("Login")
                    .font(AppFont.largeTitle)
                    .foregroundColor(AppColor.textPrimary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 16) {
                
                AppTextField(
                    placeholder: "Email",
                    text: $viewModel.email,
                    systemImage: "envelope",
                    capitalization: .never
                )
                
                VStack(spacing: 8) {
                    AppSecureField(
                        placeholder: "Password",
                        text: $viewModel.password,
                        systemImage: "lock"
                    )

                    HStack() {
                        Button {
                            
                        } label: {
                            Text("Forgot Password")
                                .font(AppFont.button)
                                .foregroundColor(AppColor.primary)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            
            Button {
                Task {
                    try await viewModel.login()
                }
            } label: {
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                        .padding()
                } else {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                }
            }
            .buttonStyle(PrimaryButtonStyle())
            
            HStack(spacing: 12) {
                Rectangle()
                    .fill(AppColor.border)
                    .frame(height: 1)
                
                Text("Or login with")
                    .font(AppFont.caption)
                    .foregroundColor(AppColor.textSecondary)
                
                Rectangle()
                    .fill(AppColor.border)
                    .frame(height: 1)
            }
            
            HStack(spacing: 24) {
                Button {
                    
                } label: {
                    VStack() {
                        Image("Google_Icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 24)
                    .background(.white)
                    .cornerRadius(8)
                    .shadow(color: .black.opacity(0.05), radius: 10, y: 2)
                }
                
                Button {
                    
                } label: {
                    VStack() {
                        Image("Apple_Icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 24)
                    .background(.white)
                    .cornerRadius(8)
                    .shadow(color: .black.opacity(0.05), radius: 10, y: 2)
                }
            }
            
            HStack {
                Text("Don't have an account?")
                    .font(AppFont.caption)
                    .foregroundColor(AppColor.textSecondary)
                
                Button {
                    viewModel.signUpTapped()
                } label: {
                    Text("Sign Up")
                        .font(AppFont.caption)
                        .foregroundColor(AppColor.primary)
                }
            }
            .padding(.bottom, 40)
        }
        .padding(32)
        .background(AppColor.surface)
        .clipShape(.rect(topLeadingRadius: 24, topTrailingRadius: 24))
        .shadow(color: .black.opacity(0.05), radius: 20, y: 10)
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel(coordinator: AuthCoordinator(), onFinish: {
        print("oke")
    }))
        
}

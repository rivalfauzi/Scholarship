//
//  SplashView.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//


import SwiftUI

struct SplashView: View {
    
    @State private var showLogo = false
    @State private var showText = false
    @State private var showLoading = false
    
    var body: some View {
        ZStack {
            AppColor.primary
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                
                Image(systemName: "graduationcap.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.white)
                    .scaleEffect(showLogo ? 1 : 0.7)
                    .opacity(showLogo ? 1 : 0)
                
                if showText {
                    Text("Halo, Selamat Datang 👋")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(.white)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                
                if showLoading {
                    ProgressView()
                        .tint(.white)
                        .padding(.top, 12)
                }
            }
        }
        .onAppear {
            animate()
        }
    }
    
    private func animate() {
        withAnimation(.easeOut(duration: 0.6)) {
            showLogo = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeOut(duration: 0.5)) {
                showText = true
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation {
                showLoading = true
            }
        }
    }
}
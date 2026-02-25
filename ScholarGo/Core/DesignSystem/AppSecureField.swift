//
//  AppSecureField.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//


import SwiftUI

struct AppSecureField: View {
    
    let placeholder: String
    @Binding var text: String
    let systemImage: String
    
    var body: some View {
        HStack(spacing: 12) {
            
            Image(systemName: systemImage)
                .foregroundColor(AppColor.textSecondary)
            
            SecureField(placeholder, text: $text)
                .font(AppFont.body)
        }
        .padding()
        .background(AppColor.surfaceMuted)
        .cornerRadius(16)
    }
}
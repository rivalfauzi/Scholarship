//
//  AppTextField.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//


import SwiftUI

struct AppTextField: View {
    
    let placeholder: String
    @Binding var text: String
    let systemImage: String
    var capitalization: TextInputAutocapitalization = .sentences
    
    var body: some View {
        HStack(spacing: 12) {
            
            Image(systemName: systemImage)
                .foregroundColor(AppColor.textSecondary)
            
            TextField(placeholder, text: $text)
                .font(AppFont.body)
                .textInputAutocapitalization(capitalization)
        }
        .padding()
        .background(AppColor.surfaceMuted)
        .cornerRadius(16)
    }
}

//
//  IconOutlineButton.swift
//  Scholarships
//
//  Created by Rival Fauzi on 01/03/26.
//


import SwiftUI

struct IconOutlineButton: View {
    
    let title: String
    let systemImage: String
    
    var borderColor: Color = AppColor.primary
    var backgroundColor: Color = .clear
    var foregroundColor: Color = AppColor.primary
    var height: CGFloat = 44
    var cornerRadius: CGFloat = 24
    var font: Font = AppFont.button
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                Image(systemName: systemImage)
                    .font(font)
                
                Text(title)
                    .font(font)
            }
            .foregroundColor(foregroundColor)
            .frame(maxWidth: .infinity)
            .frame(height: height)
        }
        .background(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .fill(backgroundColor)
        )
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(borderColor, lineWidth: 1)
        )
    }
}

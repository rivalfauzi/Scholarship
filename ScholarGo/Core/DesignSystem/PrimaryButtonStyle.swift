//
//  PrimaryButtonStyle.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(AppFont.button)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .background(AppColor.primary)
            .cornerRadius(16)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

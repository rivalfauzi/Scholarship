//
//  AppCard.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//

import SwiftUI

struct AppCard<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .padding(16)
            .background(AppColor.surface)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.05), radius: 10, y: 5)
    }
}

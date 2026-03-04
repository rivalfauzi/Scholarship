//
//  TaskListCell.swift
//  Scholarships
//
//  Created by Rival Fauzi on 01/03/26.
//

import SwiftUI

struct TaskListCell<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.surface)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(Color.border, lineWidth: 2)
                    
            )
            .shadow(color: .black.opacity(0.08), radius: 20, y: 8)
    }
}

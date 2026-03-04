//
//  AppProgressBar.swift
//  Scholarships
//
//  Created by Rival Fauzi on 28/02/26.
//


import SwiftUI

struct AppProgressBar: View {
    
    var progress: Double // 0.0 - 1.0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                
                // Track
                Capsule()
                    .fill(Color.primarySubtle)
                    .frame(height: 10)
                
                // Progress Fill
                Capsule()
                    .fill(Color.primaryPressed)
                    .frame(
                        width: geometry.size.width * progress,
                        height: 10
                    )
                    .animation(.easeInOut(duration: 0.4), value: progress)
            }
        }
        .frame(height: 8)
    }
}

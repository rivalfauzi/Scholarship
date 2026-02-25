//
//  View+Ext.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//


import SwiftUI

extension View {
    func cornerRadius(
        _ topLeft: CGFloat,
        _ topRight: CGFloat,
        _ bottomLeft: CGFloat,
        _ bottomRight: CGFloat
    ) -> some View {
        clipShape(
            RoundedCorner(
                topLeft: topLeft,
                topRight: topRight,
                bottomLeft: bottomLeft,
                bottomRight: bottomRight
            )
        )
    }
}

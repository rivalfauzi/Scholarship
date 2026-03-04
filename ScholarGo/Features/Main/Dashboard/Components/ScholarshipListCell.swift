//
//  ScholarshipListCell.swift
//  Scholarships
//
//  Created by Rival Fauzi on 01/03/26.
//

import SwiftUI

struct ScholarshipListCell: View {
    let imageFlag: String?
    let title: String
    let deadline: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 4) {
                if let imageFlag = imageFlag {
                    Image(imageFlag)
                        .resizable()
                        .frame(width: 18, height: 18)
                }
                
                Text(title)
                    .font(.footnote)
                    .foregroundColor(.textPrimary)
            }
            
            Text(deadline)
                .padding(.horizontal, 8)
                .padding(.vertical, 2)
                .font(.caption)
                .foregroundColor(.surface)
                .background(
                    RoundedRectangle(cornerRadius: 9, style: .continuous)
                        .fill(.info)
                )
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(.surfaceMuted)
        )
        .overlay {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(.border, lineWidth: 1)
        }
    }
}

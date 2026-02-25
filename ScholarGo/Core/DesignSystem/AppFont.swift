//
//  AppFont.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//

import SwiftUI

enum AppFont {
    static let largeTitle = Font.system(.largeTitle, design: .default).weight(.bold)
    static let title = Font.system(.title3).weight(.semibold)
    static let body = Font.system(.body)
    static let caption = Font.system(.caption)
    static let button = Font.system(.body).weight(.semibold)
}

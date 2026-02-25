//
//  DocumentsCoordinator.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//

import SwiftUI
import Combine

class DocumentsCoordinator: ObservableObject {
    @Published var viewModel = DocumentsViewModel()
    
    func view() -> some View {
        DocumentsView(viewModel: viewModel)
    }
    
}

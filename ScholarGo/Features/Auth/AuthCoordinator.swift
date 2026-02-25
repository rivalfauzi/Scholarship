//
//  AuthCoordinator.swift
//  Scholarships
//
//  Created by Rival Fauzi on 21/02/26.
//

import SwiftUI
import Combine

final class AuthCoordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func start(onFinish: @escaping () -> Void) -> some View {
        AuthCoordinatorView(
            coordinator: self,
            onFinish: onFinish
        )
    }
}

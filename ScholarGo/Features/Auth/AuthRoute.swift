//
//  AuthRoute.swift
//  Scholarships
//
//  Created by Rival Fauzi on 21/02/26.
//

import Foundation

enum AuthRoute: Hashable {
    case signUp
    case forgotPassword
}

typealias AuthRouter = Router<AuthRoute>

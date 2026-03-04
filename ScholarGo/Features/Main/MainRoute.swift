//
//  MainRoute.swift
//  Scholarships
//
//  Created by Rival Fauzi on 01/03/26.
//


enum MainRoute: Hashable {
    case roadmap(id: String)
    case scholarshipDetail(id: String)
}

typealias MainRouter = Router<MainRoute>

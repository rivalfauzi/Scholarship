//
//  SupabaseClientProvider.swift
//  Scholarships
//
//  Created by MCO on 19/02/26.
//

import Foundation
import Supabase

enum SupabaseClientProvider {
    static let client: SupabaseClient = {
        guard
            let urlString = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_URL") as? String,
            let supabaseKey = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_KEY") as? String,
            let supabaseURL = URL(string: urlString)
        else {
            fatalError("Supabase configuration not found")
        }
        
        return SupabaseClient(
            supabaseURL: supabaseURL,
            supabaseKey: supabaseKey
        )
    }()
}

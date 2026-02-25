//
//  SupabaseClientProvider.swift
//  Scholarships
//
//  Created by MCO on 19/02/26.
//

import Foundation
import Supabase

final class SupabaseClientProvider {
    
    static let shared = SupabaseClientProvider()
    
    let client: SupabaseClient
    
    private init() {
        guard
            let urlString = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_URL") as? String,
            let supabaseKey = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_KEY") as? String,
            let supabaseURL = URL(string: urlString)
        else {
            fatalError("Supabase configuration not found")
        }
        
        client = SupabaseClient(
            supabaseURL: supabaseURL,
            supabaseKey: supabaseKey
        )
    }
}

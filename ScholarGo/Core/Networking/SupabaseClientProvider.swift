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
        client = SupabaseClient(
            supabaseURL: URL(string: "YOUR_PROJECT_URL")!,
            supabaseKey: "YOUR_ANON_PUBLIC_KEY"
        )
    }
}

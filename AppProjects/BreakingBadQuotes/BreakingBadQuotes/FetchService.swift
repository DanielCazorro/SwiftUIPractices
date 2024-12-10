//
//  FetchService.swift
//  BreakingBadQuotes
//
//  Created by Daniel Cazorro Frías on 10/12/24.
//

import Foundation

struct FetchService {
    enum FetchError: Error {
        case badResponse
    }
    
    let baseURL = URL(string: "https://breaking-bad-api-six.vercel.app/api")!
    
    // https://breaking-bad-api-six.vercel.app/api/quotes/random?production=Breaking+Bad
    func fetchQuote(from show: String) async throws -> Quote {
        //Build fetch URL
        let quoteURL = baseURL.appending(path: "quotes/random")
        let fetchURL = quoteURL.appending(queryItems: [URLQueryItem(name: "production", value: show)])

        // Fetch Data
        
        // Handle repsonse
        
        // Decode data
        
        // Return quote
        }
}

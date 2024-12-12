//
//  ViewModel.swift
//  BreakingBadQuotes
//
//  Created by Daniel Cazorro Frías on 12/12/24.
//

import Foundation

@Observable
class ViewModel {
    enum FetchStatus {
        case notStarted
        case fetching
        case success
        case failed(error: Error)
    }
    
    private(set) var status: FetchStatus = .notStarted
    
    private let fetcher = FetchService()
    
    var quote: Quote
    var character: Character
    
    init() {
        
    }
}

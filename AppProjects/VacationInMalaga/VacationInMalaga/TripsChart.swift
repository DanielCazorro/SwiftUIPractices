//
//  ContentView.swift
//  VacationInMalaga
//
//  Created by Daniel Cazorro Frías on 1/10/24.
//

import Charts
import SwiftUI

struct SampleTripRating {
    let trip: Int
    let rating: Int
    
    static let ratings: [SampleTripRating] = [
        SampleTripRating(trip: 1, rating: 55),
        .init(trip: 2, rating: 27),
        .init(trip: 3, rating: 67),
        .init(trip: 4, rating: 72),
        .init(trip: 5, rating: 81),
    ]
}

struct TripsChart: View {
    var body: some View {
        Chart(SampleTripRating.ratings, id: \.trip) { rating in
            BarMark(x: .value("Year", rating.trip),
                      y: .value("Rating", rating.rating))
            
            LinePlot(x: "Years", y: "Ratings") { x in
                return x * 6 + 50
            }
            .foregroundStyle(.purple)
        }
        .chartXScale(domain: 1...5)
        .chartYScale(domain: 1...100)
        .padding()
    }
}

#Preview {
    TripsChart()
}

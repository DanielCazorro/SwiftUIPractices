//
//  ContentView.swift
//  VacationInMalaga
//
//  Created by Daniel Cazorro Frías on 1/10/24.
//

import Charts
import SwiftUI

struct SampleRating {
    let place: String
    let rating: Int
    
    static let ratings: [SampleRating] = [
        .init(place: "Bellagio", rating: 88),
        .init(place: "Treasure Island", rating: 33),
        .init(place: "Marina del Rey", rating: 95),
        .init(place: "Casa Batllo", rating: 8),
        .init(place: "The Venetian", rating: 90),
        .init(place: "Stratosphere", rating: 3),
        .init(place: "Luxor", rating: 5),
        .init(place: "Excalibur", rating: 99)
    ]
}

struct VegasChart: View {
    var body: some View {
        Chart(SampleRating.ratings, id: \.place) {
            rating in
            SectorMark(angle: .value("Ratings",rating.rating), innerRadius: .ratio(0.40),angularInset: 1)
            .cornerRadius(7)
            .foregroundStyle(by: .value("Place", rating.place))
        }
        .padding()
        .frame(height: 500)
    }
}

#Preview {
    VegasChart()
}

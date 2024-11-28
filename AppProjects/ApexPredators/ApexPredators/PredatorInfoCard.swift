//
//  PredatorInfoCard.swift
//  ApexPredators
//
//  Created by Daniel Cazorro Frías on 28/11/24.
//

import SwiftUI

// Information Card for the Predator
struct PredatorInfoCard: View {
    let predator: ApexPredator
    let dismissAction: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(predator.name)
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Button(action: dismissAction) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            Divider()
                .background(Color.white)
            Text("Appears In:")
                .font(.subheadline)
                .foregroundColor(.white)
            
            ForEach(predator.movies, id: \.self) { movie in
                Text("• \(movie)")
                    .font(.caption)
                    .foregroundColor(.white)
            }
            
            Text("Coordinates: \(predator.location.latitude), \(predator.location.longitude)")
                .font(.caption)
                .foregroundColor(.white)
            
        }
        .padding()
        .background(Color.black.opacity(0.8))
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding()
    }
}

// Sample Preview Data
extension ApexPredator {
    static var example: ApexPredator {
        ApexPredator(id: 1,
                     name: "Jurassic World",
                     type: .air,
                     latitude: 54365436,
                     longitude: 12345678,
                     movies: ["Movie 1", "Movie 2"],
                     movieScenes: [MovieScene(id: 1,
                                              movie: "Movie 1",
                                              sceneDescription: "Description")],
                     link: "LinkToJurassicWorld")
    }
}

#Preview {
    PredatorInfoCard(predator: ApexPredator.example) {
        print("Dismiss tapped!")
    }
}

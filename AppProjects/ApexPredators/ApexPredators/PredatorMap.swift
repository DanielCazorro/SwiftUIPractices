//
//  PredatorMap.swift
//  ApexPredators
//
//  Created by Daniel Cazorro Frías on 25/11/24.
//

import SwiftUI
import MapKit

struct PredatorMap: View {
    let predators = Predators()
    
    @State var position: MapCameraPosition
    @State var satellite = false
    @State var selectedPredator: ApexPredator? // Track the selected predator
    
    var body: some View {
        ZStack {
            // Map
            Map(position: $position) {
                ForEach(predators.apexPredators) { predator in
                    Annotation(predator.name,
                               coordinate: predator.location) {
                        Button {
                            selectedPredator = predator // Set the selected predator
                        } label: {
                            Image(predator.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 100)
                                .shadow(color: .white, radius: 3)
                                .scaleEffect(x: -1)
                        }
                    }
                }
            }
            .mapStyle(satellite ? .imagery(elevation: .realistic) : .standard(elevation: .realistic))
            .overlay(alignment: .bottomTrailing) {
                Button {
                    satellite.toggle()
                } label: {
                    Image(systemName: satellite ? "globe.americas.fill" : "globe.americas")
                        .font(.largeTitle)
                        .imageScale(.large)
                        .padding(3)
                        .background(.ultraThinMaterial)
                        .clipShape(.rect(cornerRadius: 7))
                        .shadow(radius: 3)
                        .padding()
                }
            }
            .toolbarBackground(.automatic)
            
            // Info card overlay
            if let predator = selectedPredator {
                VStack {
                    Spacer()
                    PredatorInfoCard(predator: predator) {
                        selectedPredator = nil // Dismiss the card
                    }
                }
                .transition(.move(edge: .bottom))
            }
        }
    }
}

#Preview {
    PredatorMap(position: .camera(MapCamera(centerCoordinate: Predators().apexPredators[2].location,
                                            distance: 1000,
                                            heading: 250,
                                            pitch: 80)))
    .preferredColorScheme(.dark)
}

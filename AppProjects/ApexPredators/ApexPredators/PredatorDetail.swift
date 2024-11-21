//
//  PredatorDetail.swift
//  ApexPredators
//
//  Created by Daniel Cazorro Frías on 21/11/24.
//

import SwiftUI

struct PredatorDetail: View {
    let predator: ApexPredator
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    //Bacground image
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                    
                    //Dino image
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1.5,
                               height: geo.size.height/4)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y: 6)
                }
                
                // Dino name
                
                // Current location
                
                // Appears in
                
                // Movi9e moments
                
                // Link to webpage
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPredators[2])
//        .preferredColorScheme(.dark)
}

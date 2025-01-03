//
//  PokedexWidgetBundle.swift
//  PokedexWidget
//
//  Created by Daniel Cazorro Frías on 3/1/25.
//

import WidgetKit
import SwiftUI

@main
struct PokedexWidgetBundle: WidgetBundle {
    var body: some Widget {
        PokedexWidget()
        PokedexWidgetControl()
        PokedexWidgetLiveActivity()
    }
}

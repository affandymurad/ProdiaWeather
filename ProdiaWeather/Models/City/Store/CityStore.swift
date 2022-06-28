//
//  CityStore.swift
//  ProdiaWeather
//
//  Created by Affandy Murad on 26/05/22.
//

import SwiftUI
import Combine

class CityStore: ObservableObject {
        
    @Published var cities: [City] = [City()]
    
}

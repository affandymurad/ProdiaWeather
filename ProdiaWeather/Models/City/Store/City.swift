//
//  City.swift
//  ProdiaWeather
//
//  Created by Affandy Murad on 26/05/22.
//

import SwiftUI
import Combine

class City: ObservableObject{
        
    var name: String
    var longitude: Double
    var latitude: Double

    @Published var weather: Weather?
    
    init() {
        self.name = "Jakarta"
        self.longitude = 106.816666
        self.latitude = -6.200000
        self.weather = nil
        self.getWeather()
    }
    
    init(cityData data: CityValidation.CityData) {
        self.name = data.name
        self.longitude = data.geometry.location.longitude
        self.latitude = data.geometry.location.latitude
        self.weather = nil
        self.getWeather()
    }
    
    private func getWeather() {
        WeatherManager.getWeather(for: self) { (weather) in
            DispatchQueue.main.async {
                self.weather = weather
            }
        }
    }
    
}

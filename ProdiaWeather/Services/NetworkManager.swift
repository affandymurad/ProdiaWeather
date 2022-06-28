//
//  NetworkManager.swift
//  ProdiaWeather
//
//  Created by Affandy Murad on 26/05/22.
//

import UIKit

class NetworkManager: NSObject {
    
    struct Key {
        
        static let openWeather: String = "b9056c6b1bf2f854f362ffe257a261a2" // Enter your openWeather API key here
        static let googleMaps: String = "" // Enter your google maps API key here
        
    }
    
    struct APIURL {
        
        static func weatherRequest(longitude: Double, latitude: Double) -> String {
            return "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&units=metric&lang=id&appid=\(NetworkManager.Key.openWeather)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        }
        
        static func cityCompletion(for search: String) -> String {
            return "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=\(search)&types=(cities)&key=\(NetworkManager.Key.googleMaps)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        }
        
        static func cityData(for placeID: String) -> String {
            return "https://maps.googleapis.com/maps/api/place/details/json?placeid=\(placeID)&key=\(NetworkManager.Key.googleMaps)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        }
                
    }
        
}

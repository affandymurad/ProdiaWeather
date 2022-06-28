//
//  ProdiaWeatherApp.swift
//  ProdiaWeather
//
//  Created by Affandy Murad on 26/05/22.
//

import SwiftUI

@main
struct ProdiaWeatherApp: App {
    @StateObject var authentication = Authentication()
        var body: some Scene {
            WindowGroup {
                if authentication.isValidated {
                    CityListView()
                        .environmentObject(authentication)
                } else {
                    LoginView()
                        .environmentObject(authentication)
                }
            }
        }
}

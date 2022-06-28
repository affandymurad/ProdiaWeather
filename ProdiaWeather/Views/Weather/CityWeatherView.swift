//
//  CityWeatherView.swift
//  ProdiaWeather
//
//  Created by Affandy Murad on 27/05/22.
//

import SwiftUI

struct CityWeatherView : View {
    
    @ObservedObject var city: City
    
    var body: some View {
        List {
            Section(header: Text("Now")) {
                CityHeaderView(city: city)
            }
            
            Section(header: Text("Hourly")) {
                CityHourlyView(city: city)
            }
            
            Section(header: Text("This week")) {
                ForEach(city.weather?.daily ?? []) { day in
                    CityDailyView(day: day)
                }
            }
        }
        .navigationBarTitle(Text(city.name))
    }
    
}

//struct CityWeatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        CityWeatherView()
//    }
//}

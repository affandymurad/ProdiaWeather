//
//  CityHeaderView.swift
//  ProdiaWeather
//
//  Created by Affandy Murad on 27/05/22.
//

import SwiftUI

struct CityHeaderView: View {
    
    @ObservedObject var city: City
    
    var temperature: String {
        guard let temperature = city.weather?.current.temp else {
            return "-ºC"
        }
        return temperature.formattedTemperature
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            HStack(alignment: .center, spacing: 16) {
                city.weather?.current.weather.first?.icon.image
                    .font(.largeTitle)
                Text(temperature)
                    .font(.largeTitle)
            }
            Spacer()
        }
        .frame(height: 110)
    }
    
}

//struct CityHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        CityHeaderView()
//    }
//}

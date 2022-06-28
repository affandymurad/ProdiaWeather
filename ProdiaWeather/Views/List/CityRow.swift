//
//  CityRow.swift
//  ProdiaWeather
//
//  Created by Affandy Murad on 27/05/22.
//

import SwiftUI

struct CityRow : View {
    
    @ObservedObject var city: City
    
    var body: some View {
        NavigationLink(destination: CityWeatherView(city: city)) {
            HStack(alignment: .firstTextBaseline) {
                Text(city.name)
                    .lineLimit(nil)
                    .font(.title)
                Spacer()
                HStack {
                    city.weather?.current.weather.first?.icon.image
                        .foregroundColor(Color.gray)
                        .font(.title)
                    Text(city.weather?.current.temp.formattedTemperature ?? "-ºC")
                        .foregroundColor(.gray)
                        .font(.title)
                }
            }
            .padding([.trailing, .top, .bottom])
        }
    }
    
}

//struct CityRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CityRow()
//    }
//}

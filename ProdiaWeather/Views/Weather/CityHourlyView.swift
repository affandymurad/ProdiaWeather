//
//  CityHourlyView.swift
//  ProdiaWeather
//
//  Created by Affandy Murad on 27/05/22.
//

import SwiftUI

struct CityHourlyView : View {
    
    @ObservedObject var city: City
    
    private let rowHeight: CGFloat = 110
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(city.weather?.hourly ?? []) { hour in
                    VStack(spacing: 16) {
                        Text(hour.dt.formattedHourly())
                            .font(.footnote)
                        hour.weather.first?.icon.image
                            .font(.body)
                        Text(hour.temp.formattedTemperature)
                            .font(.headline)
                    }
                }
            }
            .padding([.trailing, .leading])
        }
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .padding([.top, .bottom])
    }
    
}

//struct CityHourlyView_Previews: PreviewProvider {
//    static var previews: some View {
//        CityHourlyView()
//    }
//}

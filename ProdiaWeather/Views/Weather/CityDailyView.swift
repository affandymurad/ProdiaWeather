//
//  CityDailyView.swift
//  ProdiaWeather
//
//  Created by Affandy Murad on 27/05/22.
//

import SwiftUI

struct CityDailyView : View {
    
    @State var day: Daily
    
    var body: some View {
        ZStack {
            HStack(alignment: .center) {
                Text(day.dt.formattedDaily())
                Spacer()
                HStack(spacing: 16) {
                    verticalTemperatureView(min: true)
                    verticalTemperatureView(min: false)
                }
            }
            HStack(alignment: .center) {
                Spacer()
                day.weather.first?.icon.image
                    .font(.body)
                Spacer()
            }
        }
    }
    
    func verticalTemperatureView(min: Bool) -> some View {
        VStack(alignment: .trailing) {
            Text(min ? "min" : "max")
                .font(.footnote)
                .foregroundColor(.gray)
            Text(min ? day.temp.min.formattedTemperature : day.temp.max.formattedTemperature)
                .font(.headline)
        }
    }
    
}

//struct CityDailyView_Previews: PreviewProvider {
//    static var previews: some View {
//        CityDailyView()
//    }
//}

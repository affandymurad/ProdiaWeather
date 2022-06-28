//
//  UIApplication+Extension.swift
//  ProdiaWeather
//
//  Created by Affandy Murad on 26/05/22.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension Double {
    
    var formattedTemperature: String {
        let formatter = NumberFormatter()
        formatter.allowsFloats = false
        
        let formattedDouble = formatter.string(from: NSNumber(value: self)) ?? "-"
        return formattedDouble + "ºC"
    }
    
}

extension Int {
    
    func formattedHourly() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "id")
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }

    func formattedDaily() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "id")
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
    }
}

//
//  WeatherManager.swift
//  ProdiaWeather
//
//  Created by Affandy Murad on 26/05/22.
//

import Foundation

class WeatherManager {
    static func getWeather(for city: City, _ completion: @escaping (_ weather: Weather?) -> Void) {
        print("=== ERR 0  \(city.longitude) \(city.latitude)")
        guard let url = URL(string: NetworkManager.APIURL.weatherRequest(longitude: city.longitude, latitude: city.latitude)) else {
            completion(nil)
            print("=== ERR 1 empty")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("=== ERR 2 empty")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                
                let weatherObject = try decoder.decode(Weather.self, from: data)
                completion(weatherObject)
                print("=== ERR URL \(url)")
                print("=== ERR 30 \(weatherObject)")
            } catch let DecodingError.dataCorrupted(context) {
                print("=== ERR 4 \(context)")
            } catch let DecodingError.keyNotFound(key, context) {
                print("=== ERR 5 Key '\(key)' not found:", context.debugDescription)
                print("=== ERR 6 codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("=== ERR 7 Value '\(value)' not found:", context.debugDescription)
                print("=== ERR 8 codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("=== ERR 9 Type '\(type)' mismatch:", context.debugDescription)
                print("=== ERR 10 codingPath:", context.codingPath)
            } catch {
                print("=== ERR 11 error: ", error)
            }
        }.resume()
    }
    
}

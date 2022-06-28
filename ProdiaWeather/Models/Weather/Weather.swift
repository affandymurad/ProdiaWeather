//
//  Weather.swift
//  ProdiaWeather
//
//  Created by Affandy Murad on 26/05/22.
//

import SwiftUI

// MARK: - Weather
struct Weather: Codable {
    var lat, lon: Double
    var timezone: String
    var timezoneOffset: Int
    var current: Current
    var hourly: [Current]
    var daily: [Daily]

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, hourly, daily
    }
}

// MARK: - Current
struct Current: Codable, Identifiable {
    
    var id = UUID()
    
    var dt: Int
    var sunrise, sunset: Int?
    var temp, feelsLike: Double
    var pressure, humidity: Int
    var dewPoint, uvi: Double
    var clouds, visibility: Int
    var windSpeed: Double
    var windDeg: Int
    var windGust: Double?
    var weather: [WeatherElement]
    var pop: Double?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather, pop
    }
}

// MARK: - WeatherElement
struct WeatherElement: Codable {
    var id: Int
    var main: String
    var weatherDescription: String
    var icon: Icon

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Daily
struct Daily: Codable, Identifiable {
    
    var id = UUID()
    
    var dt, sunrise, sunset, moonrise: Int
    var moonset: Int
    var moonPhase: Double
    var temp: Temp
    var feelsLike: FeelsLike
    var pressure, humidity: Int
    var dewPoint, windSpeed: Double
    var windDeg: Int
    var windGust: Double
    var weather: [WeatherElement]
    var clouds: Int
    var pop, uvi: Double
    var rain: Double?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather, clouds, pop, uvi, rain
    }
}

// MARK: - FeelsLike
struct FeelsLike: Codable {
    var day, night, eve, morn: Double
}

// MARK: - Temp
struct Temp: Codable {
    var day, min, max, night: Double
    var eve, morn: Double
}

enum Icon: String, Codable {
    
    case clearSkyDay = "01d"
    case clearSkyNight = "01n"
    case fewCloudsDay = "02d"
    case fewCloudsNight = "02n"
    case scatteredCloudsDay = "03d"
    case scatteredCloudsNight = "03n"
    case brokenCloudsDay = "04d"
    case brokenCloudsNight = "04n"
    case showerRainDay = "09d"
    case showerRainNight = "09n"
    case rainDay = "10d"
    case rainNight = "10n"
    case thunderstormDay = "11d"
    case thunderstormNight = "11n"
    case snowDay = "13d"
    case snowNight = "13n"
    case mistDay = "50"
    case mistNight = "50n"
    
    var image: Image {
        switch self {
        case .clearSkyDay:
            return Image(systemName: "sun.max")
        case .clearSkyNight:
            return Image(systemName: "sun.max.fill")
        case .fewCloudsDay:
            return Image(systemName: "cloud.sun")
        case .fewCloudsNight:
            return Image(systemName: "cloud.sun.fill")
        case .scatteredCloudsDay:
            return Image(systemName: "cloud")
        case .scatteredCloudsNight:
            return Image(systemName: "cloud.fill")
        case .brokenCloudsDay:
            return Image(systemName: "smoke")
        case .brokenCloudsNight:
            return Image(systemName: "smoke.fill")
        case .showerRainDay:
            return Image(systemName: "cloud.heavyrain")
        case .showerRainNight:
            return Image(systemName: "cloud.heavyrain.fill")
        case .rainDay:
            return Image(systemName: "cloud.rain")
        case .rainNight:
            return Image(systemName: "cloud.rain.fill")
        case .thunderstormDay:
            return Image(systemName: "cloud.bolt.rain")
        case .thunderstormNight:
            return Image(systemName: "cloud.bolt.rain.fill")
        case .snowDay:
            return Image(systemName: "cloud.bolt")
        case .snowNight:
            return Image(systemName: "cloud.bolt.fill")
        case .mistDay:
            return Image(systemName: "cloud.bolt")
        case .mistNight:
            return Image(systemName: "cloud.bolt.fill")
        }
    }
            
}

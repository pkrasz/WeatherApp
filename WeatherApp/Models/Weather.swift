//
//  Weather.swift
//  WeatherApp
//
//  Created by Paweł Kraszewski on 31/03/2022.
//

import Foundation

struct SingleWeather: Codable {
    let weatherStateName: String
    let theTemp: Float
    let windSpeed: Float
    let airPressure: Float
    let humidity: Float
    
    enum CodingKeys: String, CodingKey {
        case weatherStateName = "weather_state_name"
        case theTemp = "the_temp"
        case windSpeed = "wind_speed"
        case airPressure = "air_pressure"
        case humidity
    }
}

struct Weather: Codable {
    let consolidated_weather: [SingleWeather]
}

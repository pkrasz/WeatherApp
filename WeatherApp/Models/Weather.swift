//
//  Weather.swift
//  WeatherApp
//
//  Created by Paweł Kraszewski on 31/03/2022.
//

import Foundation

struct SingleWeather: Codable {
    let weather_state_name: String
    let the_temp: Double
    let wind_speed: Double
    let air_pressure: Double
    let humidity: Double
}

struct Weather: Codable {
    let consolidated_weather: [SingleWeather]
}

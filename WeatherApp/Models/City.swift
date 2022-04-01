//
//  City.swift
//  WeatherApp
//
//  Created by Paweł Kraszewski on 31/03/2022.
//

import Foundation

struct City: Codable {
    let title: String
    let location_type: String
    let woeid: Int
    let latt_long: String
}

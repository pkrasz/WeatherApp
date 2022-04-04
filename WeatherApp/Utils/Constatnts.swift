//
//  Constraints.swift
//  WeatherApp
//
//  Created by Paweł Kraszewski on 01/04/2022.
//

import UIKit

enum Margins {
    static let small: CGFloat = 10
    static let medium: CGFloat = 20
    static let big: CGFloat = 50
    static let leading: CGFloat = 50
    static let trailing: CGFloat = -50
}
enum Font {
    static let big: CGFloat = 25
    static let small: CGFloat = 20
}
enum Colors {
    static let firstColor: UIColor = .systemCyan
    static let secondColor: UIColor = .systemBlue
}

enum WeatherStates {
    enum Name {
        static let snow: String = "Snow"
        static let sleet: String = "Sleet"
        static let hail: String = "Hail"
        static let thunderstorm: String = "Thunderstorm"
        static let heavyRain: String = "Heavy Rain"
        static let lightRain: String = "Light Rain"
        static let showers: String = "Showers"
        static let heavyCloud: String = "Heavy Cloud"
        static let lightCloud: String = "Light Cloud"
        static let clear: String = "Clear"
    }
    enum Image {
        static let snow: UIImage = UIImage(systemName: "cloud.snow.fill") ?? UIImage.checkmark
        static let sleet: UIImage = UIImage(systemName: "cloud.sleet.fill") ?? UIImage.checkmark
        static let hail: UIImage = UIImage(systemName: "cloud.hail.fill") ?? UIImage.checkmark
        static let thunderstorm: UIImage = UIImage(systemName: "cloud.bolt.fill") ?? UIImage.checkmark
        static let heavyRain: UIImage = UIImage(systemName: "cloud.heavyrain.fill") ?? UIImage.checkmark
        static let lightRain: UIImage = UIImage(systemName: "cloud.drizzle.fill") ?? UIImage.checkmark
        static let showers: UIImage = UIImage(systemName: "cloud.sun.rain.fill") ?? UIImage.checkmark
        static let heavyCloud: UIImage = UIImage(systemName: "cloud.fill") ?? UIImage.checkmark
        static let lightCloud: UIImage = UIImage(systemName: "cloud.sun.fill") ?? UIImage.checkmark
        static let clear: UIImage = UIImage(systemName: "sun.max.fill") ?? UIImage.checkmark
    }
}

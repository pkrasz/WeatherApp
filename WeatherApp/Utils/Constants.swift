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
        static let snow: UIImage = UIImage(systemName: "cloud.snow.fill")!
        static let sleet: UIImage = UIImage(systemName: "cloud.sleet.fill")!
        static let hail: UIImage = UIImage(systemName: "cloud.hail.fill")!
        static let thunderstorm: UIImage = UIImage(systemName: "cloud.bolt.fill")!
        static let heavyRain: UIImage = UIImage(systemName: "cloud.heavyrain.fill")!
        static let lightRain: UIImage = UIImage(systemName: "cloud.drizzle.fill")!
        static let showers: UIImage = UIImage(systemName: "cloud.sun.rain.fill")!
        static let heavyCloud: UIImage = UIImage(systemName: "cloud.fill")!
        static let lightCloud: UIImage = UIImage(systemName: "cloud.sun.fill")!
        static let clear: UIImage = UIImage(systemName: "sun.max.fill")!
        static let weatherAppLogo = UIImage(named: "weatherAppLogo")!
    }
}

enum Units {
    static let celcius: String = " °C"
    static let mph: String = " mph"
    static let milibar: String = " mbar"
    static let percent: String = " %"
}

enum Label {
    enum Text {
        static let city: String = "Miasto:"
        static let weather: String = "Pogoda:"
        static let temperature: String = "Temperatura:"
        static let windSpeed: String = "Prędkość wiatru:"
        static let pressure: String = "Ciśnienie:"
        static let humidity: String = "Wilgotność:"
        static let enterCityName: String = "Wpisz nazwę miasta"
    }
}

enum Button {
    static let check: String = "Sprawdź!"
}

enum Subview {
    static let viewBorderWidth: CGFloat = 44
    static let viewBorderWidthMinus: CGFloat = -44
    static let borderWidth: CGFloat = 1
}

enum Identifiere {
    static let cell = "UITableViewCell"
}

enum Alert {
    static let title: String = "Musisz zaznaczyć miasto!"
    static let cancel: String = "Cancel"
}

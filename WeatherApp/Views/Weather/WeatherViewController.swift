//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Paweł Kraszewski on 31/03/2022.
//

import UIKit

class WeatherViewController: UIViewController {
    
    //MARK: - Properties
    
    var contentView: WeatherView {
        return view as! WeatherView
    }
    var cityName: String
    var cityKey: Int
    var weatherState: String?
    var temperature: Double?
    var windSpeed: Double?
    var pressure: Double?
    var humidity: Double?
    
    //MARK: - Initializators
    
    init(cityName: String, cityKey: Int) {
        self.cityName = cityName
        self.cityKey = cityKey
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Lifecycle
    
    override func loadView() {
        view = WeatherView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setupBindings()
        setupView()
        
    }
    
    //MARK: - Setup
    
    private func setupView() {
        while weatherState == nil {
            print("CIPA")
        }
        
        guard let weatherState = weatherState else {return}
        guard let temperature = temperature else {return}
        guard let windSpeed = windSpeed else {return}
        guard let pressure = pressure else {return}
        guard let humidity = humidity else {return}
        
        contentView.cityTextLabel.text = cityName
        contentView.weatherStateTextLabel.text = weatherState
        contentView.temperatureTextLabel.text = "\(String(temperature)) °C"
        contentView.windSpeedTextLabel.text = "\(String(windSpeed)) mph"
        contentView.pressureTextLabel.text = "\(String(pressure)) mbar"
        contentView.humidityTextLabel.text = "\(String(humidity)) %"
        
    }
    
    private func setupBindings() {
        let apiClient = ApiClient.shared
        apiClient.getData(for: .weather(String(cityKey)), as: Weather.self) { [weak self] weather in
            let firstWeather = weather.consolidated_weather[0]
            self?.weatherState = firstWeather.weather_state_name
            self?.temperature = firstWeather.the_temp
            self?.windSpeed = firstWeather.wind_speed
            self?.pressure = firstWeather.air_pressure
            self?.humidity = firstWeather.humidity
        }
    }
}



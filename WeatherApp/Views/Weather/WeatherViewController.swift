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
    var weather: SingleWeather? {
        didSet {
            DispatchQueue.main.async {
                self.loadInformation()
            }
        }
    }
    
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
        
    }
    
    private func setupBindings() {
        let apiClient = ApiClient.shared
        apiClient.getData(for: .weather(String(cityKey)), as: Weather.self) { [weak self] weather in
            let firstWeather = weather.consolidated_weather[0]
            self?.weather = firstWeather
        }
    }
    
    //MARK: - Methods
    
    private func loadInformation() {
        guard let weather = weather else {return}
        contentView.cityTextLabel.text = cityName
        contentView.weatherStateTextLabel.text = weather.weather_state_name
        contentView.temperatureTextLabel.text = "\(String(weather.the_temp)) °C"
        contentView.windSpeedTextLabel.text = "\(String(weather.wind_speed)) mph"
        contentView.pressureTextLabel.text = "\(String(weather.air_pressure)) mbar"
        contentView.humidityTextLabel.text = "\(String(weather.humidity)) %"
        
    }
}



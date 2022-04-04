//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Paweł Kraszewski on 31/03/2022.
//

import UIKit

final class WeatherViewController: UIViewController {
    
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
        self.navigationController?.navigationBar.backgroundColor = .systemCyan
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
        
        contentView.activityIndicatorView.isHidden = true
        
        guard let weather = weather else {return}
        
        switch weather.weatherStateName {
        case WeatherStates.Name.clear:
            contentView.weatherImageView.image = WeatherStates.Image.clear
        case WeatherStates.Name.hail:
            contentView.weatherImageView.image = WeatherStates.Image.hail
        case WeatherStates.Name.heavyCloud:
            contentView.weatherImageView.image = WeatherStates.Image.heavyCloud
        case WeatherStates.Name.heavyRain:
            contentView.weatherImageView.image = WeatherStates.Image.heavyRain
        case WeatherStates.Name.lightCloud:
            contentView.weatherImageView.image = WeatherStates.Image.lightCloud
        case WeatherStates.Name.lightRain:
            contentView.weatherImageView.image = WeatherStates.Image.lightRain
        case WeatherStates.Name.showers:
            contentView.weatherImageView.image = WeatherStates.Image.showers
        case WeatherStates.Name.sleet:
            contentView.weatherImageView.image = WeatherStates.Image.sleet
        case WeatherStates.Name.snow:
            contentView.weatherImageView.image = WeatherStates.Image.snow
        case WeatherStates.Name.thunderstorm:
            contentView.weatherImageView.image = WeatherStates.Image.thunderstorm
        default:
            contentView.weatherImageView.image = UIImage(systemName: "cloud.sun")
        }
        
        contentView.cityTextLabel.text = cityName
        contentView.weatherStateTextLabel.text = weather.weatherStateName
        contentView.temperatureTextLabel.text = "\(String(weather.theTemp)) °C"
        contentView.windSpeedTextLabel.text = "\(String(weather.windSpeed)) mph"
        contentView.pressureTextLabel.text = "\(String(weather.airPressure)) mbar"
        contentView.humidityTextLabel.text = "\(String(weather.humidity)) %"
        
        UIView.animate(withDuration: 0.5) {
            self.contentView.layoutIfNeeded()
        }
    }
}



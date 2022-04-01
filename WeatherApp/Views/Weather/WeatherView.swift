//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Paweł Kraszewski on 31/03/2022.
//

import UIKit

class WeatherView: UIView {
    
    //MARK: - SubView
    let weatherImageView: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "cloud.sun.fill"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .systemCyan
        return image
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Miasto:"
        label.textColor = .white
        label.backgroundColor = .systemCyan
        label.font = .boldSystemFont(ofSize: Constants.Font.big)
        label.textAlignment = .center
        return label
    }()
    
    let cityTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Warsaw"
        label.textColor = .systemBlue
        label.font = .boldSystemFont(ofSize: Constants.Font.small)
        
        return label
    }()
    
    let weatherStateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pogoda:"
        label.textColor = .white
        label.backgroundColor = .systemCyan
        label.font = .boldSystemFont(ofSize: Constants.Font.big)
        label.textAlignment = .center
        
        return label
    }()
    
    let weatherStateTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Heavy Rain"
        label.textColor = .systemBlue
        label.font = .boldSystemFont(ofSize: Constants.Font.small)
        return label
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Temperatura:"
        label.textColor = .white
        label.backgroundColor = .systemCyan
        label.font = .boldSystemFont(ofSize: Constants.Font.big)
        label.textAlignment = .center
        return label
    }()
    
    let temperatureTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "22°C"
        label.textColor = .systemBlue
        label.font = .boldSystemFont(ofSize: Constants.Font.small)
        return label
    }()
    
    let windSpeedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Prędkość wiatru:"
        label.textColor = .white
        label.backgroundColor = .systemCyan
        label.font = .boldSystemFont(ofSize: Constants.Font.big)
        label.textAlignment = .center
        return label
    }()
    
    let windSpeedTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2.444 mph"
        label.textColor = .systemBlue
        label.font = .boldSystemFont(ofSize: Constants.Font.small)
        return label
    }()
    
    let pressureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ciśnienie:"
        label.textColor = .white
        label.backgroundColor = .systemCyan
        label.font = .boldSystemFont(ofSize: Constants.Font.big)
        label.textAlignment = .center
        return label
    }()
    
    let pressureTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1.45 mbar"
        label.textColor = .systemBlue
        label.font = .boldSystemFont(ofSize: Constants.Font.small)
        return label
    }()
    
    let humidityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Wilgotność:"
        label.textColor = .white
        label.backgroundColor = .systemCyan
        label.font = .boldSystemFont(ofSize: Constants.Font.big)
        label.textAlignment = .center
        return label
    }()
    
    let humidityTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "6.788 %"
        label.textColor = .systemBlue
        label.font = .boldSystemFont(ofSize: Constants.Font.small)
        return label
    }()
    
    
    //MARK: - Initializator
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupSubview()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    private func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 50
        layer.borderWidth = 40
        layer.borderColor = UIColor.systemCyan.cgColor
    }
    
    private func setupSubview() {
        addSubview(weatherImageView)
        addSubview(cityLabel)
        addSubview(cityTextLabel)
        addSubview(weatherStateLabel)
        addSubview(weatherStateTextLabel)
        addSubview(temperatureLabel)
        addSubview(temperatureTextLabel)
        addSubview(windSpeedLabel)
        addSubview(windSpeedTextLabel)
        addSubview(pressureLabel)
        addSubview(pressureTextLabel)
        addSubview(humidityLabel)
        addSubview(humidityTextLabel)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            weatherImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            weatherImageView.widthAnchor.constraint(equalToConstant: 250),
            weatherImageView.heightAnchor.constraint(equalToConstant: 180),
            weatherImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            cityLabel.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor, constant: Constants.Margins.big),
            cityLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            cityLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            cityTextLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: Constants.Margins.small),
            cityTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Margins.leading),
            cityTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.Margins.trailing),
            
            weatherStateLabel.topAnchor.constraint(equalTo: cityTextLabel.bottomAnchor, constant: Constants.Margins.small),
            weatherStateLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            weatherStateLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            weatherStateTextLabel.topAnchor.constraint(equalTo: weatherStateLabel.bottomAnchor, constant: Constants.Margins.small),
            weatherStateTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Margins.leading),
            weatherStateTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.Margins.trailing),
            
            temperatureLabel.topAnchor.constraint(equalTo: weatherStateTextLabel.bottomAnchor, constant: Constants.Margins.small),
            temperatureLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            temperatureTextLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: Constants.Margins.small),
            temperatureTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Margins.leading),
            temperatureTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.Margins.trailing),
            
            windSpeedLabel.topAnchor.constraint(equalTo: temperatureTextLabel.bottomAnchor, constant: Constants.Margins.small),
            windSpeedLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            windSpeedLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            windSpeedTextLabel.topAnchor.constraint(equalTo: windSpeedLabel.bottomAnchor, constant: Constants.Margins.small),
            windSpeedTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Margins.leading),
            windSpeedTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.Margins.trailing),
            
            pressureLabel.topAnchor.constraint(equalTo: windSpeedTextLabel.bottomAnchor, constant: Constants.Margins.small),
            pressureLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            pressureLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            pressureTextLabel.topAnchor.constraint(equalTo: pressureLabel.bottomAnchor, constant: Constants.Margins.small),
            pressureTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Margins.leading),
            pressureTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.Margins.trailing),
            
            humidityLabel.topAnchor.constraint(equalTo: pressureTextLabel.bottomAnchor, constant: Constants.Margins.small),
            humidityLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            humidityLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            humidityTextLabel.topAnchor.constraint(equalTo: humidityLabel.bottomAnchor, constant: Constants.Margins.small),
            humidityTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Margins.leading),
            humidityTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.Margins.trailing)
            
        ])
    }
}



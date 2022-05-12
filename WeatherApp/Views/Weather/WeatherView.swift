//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Paweł Kraszewski on 31/03/2022.
//

import UIKit

final class WeatherView: UIView {
    
    //MARK: - SubView
    
    let weatherImageView: UIImageView = {
        let image = UIImageView()
        image.tintColor = .systemBlue
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.text = Label.Text.city
        label.textColor = .white
        label.backgroundColor = .systemCyan
        label.font = .boldSystemFont(ofSize: Font.big)
        label.textAlignment = .center
        return label
    }()
    
    let cityTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .boldSystemFont(ofSize: Font.small)
        return label
    }()
    
    let weatherStateLabel: UILabel = {
        let label = UILabel()
        label.text = Label.Text.weather
        label.textColor = .white
        label.backgroundColor = .systemCyan
        label.font = .boldSystemFont(ofSize: Font.big)
        label.textAlignment = .center
        return label
    }()
    
    let weatherStateTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .boldSystemFont(ofSize: Font.small)
        return label
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = Label.Text.temperature
        label.textColor = .white
        label.backgroundColor = .systemCyan
        label.font = .boldSystemFont(ofSize: Font.big)
        label.textAlignment = .center
        return label
    }()
    
    let temperatureTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .boldSystemFont(ofSize: Font.small)
        return label
    }()
    
    let windSpeedLabel: UILabel = {
        let label = UILabel()
        label.text = Label.Text.windSpeed
        label.textColor = .white
        label.backgroundColor = .systemCyan
        label.font = .boldSystemFont(ofSize: Font.big)
        label.textAlignment = .center
        return label
    }()
    
    let windSpeedTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .boldSystemFont(ofSize: Font.small)
        return label
    }()
    
    let pressureLabel: UILabel = {
        let label = UILabel()
        label.text = Label.Text.pressure
        label.textColor = .white
        label.backgroundColor = .systemCyan
        label.font = .boldSystemFont(ofSize: Font.big)
        label.textAlignment = .center
        return label
    }()
    
    let pressureTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .boldSystemFont(ofSize: Font.small)
        return label
    }()
    
    let humidityLabel: UILabel = {
        let label = UILabel()
        label.text = Label.Text.humidity
        label.textColor = .white
        label.backgroundColor = .systemCyan
        label.font = .boldSystemFont(ofSize: Font.big)
        label.textAlignment = .center
        return label
    }()
    
    let humidityTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .boldSystemFont(ofSize: Font.small)
        return label
    }()
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.startAnimating()
        activityIndicator.color = .systemBlue
        activityIndicator.transform = CGAffineTransform.init(scaleX: Constants.transform, y: Constants.transform)
        return activityIndicator
    }()
    
    let spaceImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemCyan
        return image
    }()
    
    let logoImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemCyan
        image.contentMode = .scaleAspectFit
        return image
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
        layer.borderWidth = Subview.viewBorderWidth
        layer.borderColor = UIColor.systemCyan.cgColor
    }
    
    private func setupSubview() {
        [weatherImageView,
         cityLabel,
         cityTextLabel,
         weatherStateLabel,
         weatherStateTextLabel,
         temperatureLabel,
         temperatureTextLabel,
         windSpeedLabel,
         windSpeedTextLabel,
         pressureLabel,
         pressureTextLabel,
         humidityLabel,
         humidityTextLabel,
         activityIndicatorView,
         spaceImageView,
        logoImageView]
            .forEach(addSubview)
    }
    
    private func setupConstraints() {
        weatherImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(Constants.imageTop)
            $0.leading.equalToSuperview().offset(Subview.viewBorderWidth)
            $0.trailing.equalToSuperview().offset(Subview.viewBorderWidthMinus)
            $0.height.equalToSuperview().multipliedBy(Constants.multiplied)
            $0.centerX.equalToSuperview()
        }
        cityLabel.snp.makeConstraints {
            $0.top.equalTo(weatherImageView.snp.bottom).offset(Margins.medium)
            $0.leading.trailing.equalToSuperview()
        }
        
        cityTextLabel.snp.makeConstraints {
            $0.top.equalTo(cityLabel.snp.bottom).offset(Margins.small)
            $0.leading.equalTo(Margins.leading)
            $0.trailing.equalTo(Margins.trailing)
        }
        
        weatherStateLabel.snp.makeConstraints {
            $0.top.equalTo(cityTextLabel.snp.bottom).offset(Margins.small)
            $0.leading.trailing.equalToSuperview()
        }
        
        weatherStateTextLabel.snp.makeConstraints {
            $0.top.equalTo(weatherStateLabel.snp.bottom).offset(Margins.small)
            $0.leading.equalTo(Margins.leading)
            $0.trailing.equalTo(Margins.trailing)
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.top.equalTo(weatherStateTextLabel.snp.bottom).offset(Margins.small)
            $0.leading.trailing.equalToSuperview()
        }
        
        temperatureTextLabel.snp.makeConstraints {
            $0.top.equalTo(temperatureLabel.snp.bottom).offset(Margins.small)
            $0.leading.equalTo(Margins.leading)
            $0.trailing.equalTo(Margins.trailing)
        }
        
        windSpeedLabel.snp.makeConstraints {
            $0.top.equalTo(temperatureTextLabel.snp.bottom).offset(Margins.small)
            $0.leading.trailing.equalToSuperview()
        }
        
        windSpeedTextLabel.snp.makeConstraints {
            $0.top.equalTo(windSpeedLabel.snp.bottom).offset(Margins.small)
            $0.leading.equalTo(Margins.leading)
            $0.trailing.equalTo(Margins.trailing)
        }
        
        pressureLabel.snp.makeConstraints {
            $0.top.equalTo(windSpeedTextLabel.snp.bottom).offset(Margins.small)
            $0.leading.trailing.equalToSuperview()
        }
        
        pressureTextLabel.snp.makeConstraints {
            $0.top.equalTo(pressureLabel.snp.bottom).offset(Margins.small)
            $0.leading.equalTo(Margins.leading)
            $0.trailing.equalTo(Margins.trailing)
        }
        
        humidityLabel.snp.makeConstraints {
            $0.top.equalTo(pressureTextLabel.snp.bottom).offset(Margins.small)
            $0.leading.trailing.equalToSuperview()
        }
        
        humidityTextLabel.snp.makeConstraints {
            $0.top.equalTo(humidityLabel.snp.bottom).offset(Margins.small)
            $0.leading.equalTo(Margins.leading)
            $0.trailing.equalTo(Margins.trailing)
        }
        
        spaceImageView.snp.makeConstraints {
            $0.top.equalTo(humidityTextLabel.snp.bottom).offset(Margins.small)
            $0.leading.equalToSuperview().offset(Subview.viewBorderWidth)
            $0.trailing.equalToSuperview().offset(Subview.viewBorderWidthMinus)
            $0.height.equalTo(Margins.small)
        }
        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(spaceImageView.snp.bottom)
            $0.leading.greaterThanOrEqualToSuperview().offset(Subview.viewBorderWidth)
            $0.trailing.lessThanOrEqualToSuperview().offset(Subview.viewBorderWidthMinus)
            $0.centerX.equalToSuperview()
            $0.bottom.lessThanOrEqualToSuperview().offset(Subview.viewBorderWidthMinus)
        }
        
        activityIndicatorView.snp.makeConstraints {
            $0.centerX.equalTo(weatherImageView.snp.centerX)
            $0.centerY.equalTo(weatherImageView.snp.centerY)
        }
    }
}

    //MARK: - Extensions

extension WeatherView {
    enum WeatherView {
        
    }
    enum Constants {
        static let transform: CGFloat = 2
        static let multiplied: CGFloat = 0.11
        static let imageTop: CGFloat = 20
    }
}

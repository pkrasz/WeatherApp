//
//  ViewController.swift
//  WeatherApp
//
//  Created by Paweł Kraszewski on 31/03/2022.
//

import UIKit

class EnterViewController: UIViewController {
    
    //MARK: - Properties
    
    var contentView: EnterView {
        return view as! EnterView
    }
    var cityKey: Int?
    var cityName: String?
    
    //MARK: - Lifecycle
    
    override func loadView() {
        view = EnterView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupBindings()
    }
    
    //MARK: - Setup
    
    private func setupView() {
        
    }
    
    private func setupBindings() {
        // UNOWNED gdy wiesz ze cos bedzie od razu np tapniecie na buttona
        let textEditing = UIAction { [unowned self] _ in
            let city = self.contentView.cityTextField.text
            guard let city = city else {
                return
            }
            let apiClient = ApiClient.shared
            // WEAK gdy wiesz ze cos nie jest od razu np odpowiedz z serwera
            apiClient.getData(for: .city(city), as: [City].self) { [weak self] cities in
                let firstCity = cities[0]
                self?.cityKey = firstCity.woeid
                self?.cityName = firstCity.title
            }
            print("zrobione")
            guard let cityKey = cityKey else {return}
            guard let cityName = cityName else {return}

            let weatherViewController = WeatherViewController(cityName: cityName, cityKey: cityKey)
            self.navigationController?.pushViewController(weatherViewController, animated: true)
        }
        
        contentView.checkButton.addAction(textEditing, for: .touchUpInside)
//        contentView.checkButton.addTarget(self, action: #selector(coordinateToWeather), for: .touchUpInside)
        
    }
    
//    @objc private func coordinateToWeather() {
//        let weatherViewController = WeatherViewController(cityName: cityName, cityKey: cityKey)
//        self.navigationController?.pushViewController(weatherViewController, animated: true)
//    }
}

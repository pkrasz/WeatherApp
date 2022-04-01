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
        
        setupView()
        setupBindings()
        print("")
        print("Jestesmy na Weather!")
        print(cityKey)
        print(cityName)
        
    }
    
    //MARK: - Setup
    
    private func setupView() {
        
    }
    
    private func setupBindings() {
        
    }
}



//
//  ViewController.swift
//  WeatherApp
//
//  Created by Paweł Kraszewski on 31/03/2022.
//

import UIKit

final class EnterViewController: UIViewController {
    
    //MARK: - Properties
    
    var contentView: EnterView {
        return view as! EnterView
    }
    
    var cityKey: Int?
    var cityName: String?
    var cities: [City] = [] {
        didSet {
            DispatchQueue.main.async {
                self.contentView .tableView.reloadData()
                self.contentView.changeTableViewHeight()
            }
        }
    }
    
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
        
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: Identifiere.cell)
    }
    
    private func setupBindings() {
        let textEditing = UIAction { [unowned self] _ in
            let city = self.contentView.cityTextField.text
            guard let city = city else { return }
            
            if city == "" {
                cities = []
            } else {
                let apiClient = ApiClient.shared
                apiClient.getData(for: .city(city), as: [City].self) { [weak self] cities in
                    self?.cities = cities
                }
            }
        }
        contentView.cityTextField.addAction(textEditing, for: .editingChanged)
        
        let tapped = UIAction{ [unowned self] _ in
            if cityKey == nil && cityName == nil {
                let alert = UIAlertController(title: Alert.title, message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: Alert.cancel, style: .default, handler: nil))
                present(alert, animated: true)
            } else {
                guard let cityKey = cityKey else { return }
                guard let cityName = cityName else { return }
                
                let weatherViewController = WeatherViewController(cityName: cityName, cityKey: cityKey)
                self.navigationController?.pushViewController(weatherViewController, animated: true)
            }
        }
        contentView.checkButton.addAction(tapped, for: .touchUpInside)
    }
    
    //MARK: - Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}

extension EnterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiere.cell, for: indexPath)
        cell.textLabel?.text = cities[indexPath.row].title
        cell.backgroundColor = .systemCyan
        cell.textLabel?.textColor = .white
        return cell
    }
}

extension EnterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cityName = cities[indexPath.row].title
        cityKey = cities[indexPath.row].woeid
        contentView.cityTextField.text = cityName
    }
}

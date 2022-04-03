//
//  EnterView.swift
//  WeatherApp
//
//  Created by Paweł Kraszewski on 31/03/2022.
//

import UIKit
import SwiftUI

class EnterView: UIView {
    
    //MARK: - SubView
    let logoImageView: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "cloud.sun.fill"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .systemBlue
        return image
    }()
    let cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Wpisz nazwę miasta!"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: Constants.Font.small)
        return label
    }()
    
    let cityTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.textColor = .white
        return textField
    }()
    
    let checkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Sprawdź!", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        return button
    }()
    
    var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = Constants.Font.small
        table.backgroundColor = .systemCyan
        table.separatorColor = .white
        return table
    }()
    
    var tableHeightAnchor: NSLayoutConstraint?
    
//    var tableHeight: Double = 40.0
    
    //MARK: - Initializator
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        tableHeightAnchor = tableView.heightAnchor.constraint(equalToConstant: 0)
        guard let tableHeightAnchor = tableHeightAnchor else {return}
        tableHeightAnchor.isActive = true
        
        setupView()
        setupSubview()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    private func setupView() {
        backgroundColor = .systemCyan
        print(tableView.contentSize.height)
        print("ROOZAMIR WYZEJ Z ENTER")
    }
    
    private func setupSubview() {
        addSubview(logoImageView)
        addSubview(cityLabel)
        addSubview(cityTextField)
        addSubview(checkButton)
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        guard let tableHeightAnchor = tableHeightAnchor else {return}
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.Margins.medium),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 250),
            logoImageView.heightAnchor.constraint(equalToConstant: 180),
            
            cityLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: Constants.Margins.big),
            cityLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            cityTextField.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 10),
            cityTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            cityTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            cityTextField.heightAnchor.constraint(equalToConstant: Constants.Font.small),
            
            tableView.topAnchor.constraint(equalTo: cityTextField.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: cityTextField.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: cityTextField.trailingAnchor),
            tableHeightAnchor,
            
            checkButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: Constants.Margins.small),
            checkButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            checkButton.widthAnchor.constraint(equalToConstant: 200),
            checkButton.heightAnchor.constraint(equalToConstant: Constants.Margins.big),
            checkButton.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor)
            
        ])
    }
    //MARK: - Methods
    
    func changeTableViewHeight() {
        tableView.reloadData()
        let height = tableView.contentSize.height
        print("PONIZEJ WYNIK")
        print(height)
        guard let tableHeightAnchor = tableHeightAnchor else {return}
        if height < 160 {
            tableHeightAnchor.constant = height
        } else {
            tableHeightAnchor.constant = 160
        }
    }
}


//
//  EnterView.swift
//  WeatherApp
//
//  Created by Paweł Kraszewski on 31/03/2022.
//

import UIKit

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
        label.text = "Podaj miasto w jakim chcesz sprawdzić pogodę!"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 15)
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
        backgroundColor = .systemCyan
    }
    
    private func setupSubview() {
        addSubview(logoImageView)
        addSubview(cityLabel)
        addSubview(cityTextField)
        addSubview(checkButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 250),
            logoImageView.heightAnchor.constraint(equalToConstant: 180),
            
            cityLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            cityLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            cityTextField.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 10),
            cityTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            cityTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            
            checkButton.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 50),
            checkButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            checkButton.widthAnchor.constraint(equalToConstant: 200),
            checkButton.heightAnchor.constraint(equalToConstant: 50)
            
            
        ])
    }
}


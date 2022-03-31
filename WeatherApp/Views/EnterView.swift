//
//  EnterView.swift
//  WeatherApp
//
//  Created by Paweł Kraszewski on 31/03/2022.
//

import UIKit

class EnterView: UIView {

    //MARK: - SubView
       
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
        }
        
        private func setupSubview() {
        
        }
        
        private func setupConstraints() {
            NSLayoutConstraint.activate([
                
           ])
        }
    }


//
//  ViewController.swift
//  WeatherApp
//
//  Created by Paweł Kraszewski on 31/03/2022.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
        
        var contentView: EnterView {
            return view as! EnterView
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
        
        }
        
        private func setupBindings() {

        }
    }


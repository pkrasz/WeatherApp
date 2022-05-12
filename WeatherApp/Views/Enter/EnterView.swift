//
//  EnterView.swift
//  WeatherApp
//
//  Created by Paweł Kraszewski on 31/03/2022.
//

import UIKit
import SnapKit

final class EnterView: UIView {
    
    //MARK: - Properties
    
    var tableHeightAnchor: CGFloat = 0

    //MARK: - SubView
    
    let logoImageView: UIImageView = {
        let image = UIImageView(image: WeatherStates.Image.weatherAppLogo)
        image.contentMode = .scaleAspectFit
        return image
    }()
    let cityLabel: UILabel = {
        let label = UILabel()
        label.text = Label.Text.enterCityName
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: Font.small)
        return label
    }()
    
    let cityTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = Subview.borderWidth
        textField.layer.borderColor = UIColor.white.cgColor
        textField.textColor = .white
        return textField
    }()
    
    let checkButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle(Button.check, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: Constants.buttonLabelSize)
        return button
    }()
    
    var tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = Font.small
        table.backgroundColor = .systemCyan
        table.separatorColor = .white
        return table
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
        [logoImageView,
        cityLabel,
        cityTextField,
        checkButton,
        tableView]
            .forEach(addSubview)
    }
    
    private func setupConstraints() {
        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(Margins.medium)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(Constants.logoLeading)
            $0.trailing.equalToSuperview().offset(Constants.logoTrailing)
            $0.height.equalToSuperview().multipliedBy(Constants.multiplied)
        }
        
        cityLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(Margins.big)
            $0.centerX.equalToSuperview()
        }
        
        cityTextField.snp.makeConstraints {
            $0.top.equalTo(cityLabel.snp.bottom).offset(Constants.textFieldTop)
            $0.leading.equalToSuperview().offset(Constants.textFieldLeading)
            $0.trailing.equalToSuperview().offset(Constants.textFieldTrailing)
            $0.height.equalTo(Margins.medium)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(cityTextField.snp.bottom)
            $0.leading.equalTo(cityTextField)
            $0.trailing.equalTo(cityTextField)
            $0.height.equalTo(tableHeightAnchor)
        }
        
        checkButton.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom).offset(Margins.small)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(Constants.buttonWidth)
            $0.height.equalTo(Margins.big)
            $0.bottom.lessThanOrEqualToSuperview()
        }
        
    }
    
    //MARK: - Methods
    
    func changeTableViewHeight() {
        let height = tableView.contentSize.height
        
        if height < Constants.tableHeight {
            tableHeightAnchor = height
        } else {
            tableHeightAnchor = Constants.tableHeight
        }
        tableView.snp.updateConstraints { (make) in
            make.height.equalTo(tableHeightAnchor)
        }
        UIView.animate(withDuration: Constants.animate) {
            self.layoutIfNeeded()
        }
    }
}

    //MARK: - Extensions

extension EnterView {
    enum Constants {
        static let buttonLabelSize: CGFloat = 20
        static let multiplied: CGFloat = 0.3
        static let animate: CGFloat = 0.3
        static let logoLeading: CGFloat = 30
        static let logoTrailing: CGFloat = -30
        static let textFieldTop: CGFloat = 10
        static let textFieldLeading: CGFloat = 80
        static let textFieldTrailing: CGFloat = -80
        static let buttonWidth: CGFloat = 200
        static let tableHeight: CGFloat = 160
    }
}


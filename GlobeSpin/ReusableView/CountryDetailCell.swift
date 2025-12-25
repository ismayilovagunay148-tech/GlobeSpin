//
//  CountryDetailCell.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 20.12.25.
//

import UIKit
import Alamofire

class CountryDetailCell: UITableViewCell {
    
    static let identifier = "CountryDetailCell"
    
    private let countryImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .systemGray5
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .semibold)
        button.setImage(UIImage(systemName: "chevron.left", withConfiguration: config), for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let countryNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let capitalLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.4, green: 0.7, blue: 0.85, alpha: 1.0)
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherConditionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherIconView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let funFactHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Fun Fact"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let funFactLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let funFactIconLabel: UILabel = {
        let label = UILabel()
        label.text = "💡"
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let wouldYouGoLabel: UILabel = {
        let label = UILabel()
        label.text = "Would You Go?"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let yesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Yes 👍", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.2, green: 0.5, blue: 1.0, alpha: 1.0)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let voteInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Your vote helps personalize your adventure."
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let spinAgainButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("🌍 Spin Again", for: .normal)
        button.setTitleColor(UIColor(red: 0.4, green: 0.7, blue: 0.85, alpha: 1.0), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var backButtonAction: (() -> Void)?
    var yesButtonAction: (() -> Void)?
    var spinAgainButtonAction: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        selectionStyle = .none
        backgroundColor = .clear
        
        [countryImageView, backButton, countryNameLabel, capitalLabel,
         weatherContainerView, funFactHeaderLabel, funFactIconLabel, funFactLabel,
         wouldYouGoLabel, yesButton, voteInfoLabel, spinAgainButton]
            .forEach { contentView.addSubview($0) }

        
        weatherContainerView.addSubview(temperatureLabel)
        weatherContainerView.addSubview(weatherConditionLabel)
        weatherContainerView.addSubview(weatherIconView)
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        yesButton.addTarget(self, action: #selector(yesButtonTapped), for: .touchUpInside)
        spinAgainButton.addTarget(self, action: #selector(spinAgainButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            countryImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            countryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            countryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            countryImageView.heightAnchor.constraint(equalToConstant: 300),
            
            backButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            
            countryNameLabel.topAnchor.constraint(equalTo: countryImageView.bottomAnchor, constant: 24),
            countryNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            countryNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            capitalLabel.topAnchor.constraint(equalTo: countryNameLabel.bottomAnchor, constant: 6),
            capitalLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            
            weatherContainerView.topAnchor.constraint(equalTo: capitalLabel.bottomAnchor, constant: 20),
            weatherContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            weatherContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            weatherContainerView.heightAnchor.constraint(equalToConstant: 100),
            
            temperatureLabel.leadingAnchor.constraint(equalTo: weatherContainerView.leadingAnchor, constant: 20),
            temperatureLabel.centerYAnchor.constraint(equalTo: weatherContainerView.centerYAnchor, constant: -10),
            
            weatherConditionLabel.leadingAnchor.constraint(equalTo: weatherContainerView.leadingAnchor, constant: 20),
            weatherConditionLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 4),
            
            weatherIconView.trailingAnchor.constraint(equalTo: weatherContainerView.trailingAnchor, constant: -20),
            weatherIconView.centerYAnchor.constraint(equalTo: weatherContainerView.centerYAnchor),
            weatherIconView.widthAnchor.constraint(equalToConstant: 60),
            weatherIconView.heightAnchor.constraint(equalToConstant: 60),
            
            funFactHeaderLabel.topAnchor.constraint(equalTo: weatherContainerView.bottomAnchor, constant: 28),
            funFactHeaderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            
            funFactIconLabel.centerYAnchor.constraint(equalTo: funFactHeaderLabel.centerYAnchor),
            funFactIconLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            funFactLabel.topAnchor.constraint(equalTo: funFactHeaderLabel.bottomAnchor, constant: 12),
            funFactLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            funFactLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            wouldYouGoLabel.topAnchor.constraint(equalTo: funFactLabel.bottomAnchor, constant: 32),
            wouldYouGoLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            yesButton.topAnchor.constraint(equalTo: wouldYouGoLabel.bottomAnchor, constant: 16),
            yesButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            yesButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            yesButton.heightAnchor.constraint(equalToConstant: 56),
            
            voteInfoLabel.topAnchor.constraint(equalTo: yesButton.bottomAnchor, constant: 8),
            voteInfoLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            spinAgainButton.topAnchor.constraint(equalTo: voteInfoLabel.bottomAnchor, constant: 16),
            spinAgainButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            spinAgainButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
        ])
    }
    
    func configure(country: Country) {
        countryNameLabel.text = country.name
        temperatureLabel.text = country.weather.displayTemperature
        weatherConditionLabel.text = country.weather.description
        funFactLabel.text = country.funFact
        capitalLabel.text = "\(country.locationIcon) \(country.capital)"
        
        loadImage(from: country.imageURL)
    }
    
    private func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            countryImageView.backgroundColor = .systemGray5
            return
        }
        
        AF.request(url).responseData { [weak self] response in
            switch response.result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.countryImageView.image = UIImage(data: data)
                }
            case .failure:
                DispatchQueue.main.async {
                    self?.countryImageView.backgroundColor = .systemGray5
                }
            }
        }
    }
    
    @objc private func backButtonTapped() {
        backButtonAction?()
    }
    
    @objc private func yesButtonTapped() {
        yesButtonAction?()
    }
    
    @objc private func spinAgainButtonTapped() {
        spinAgainButtonAction?()
    }
}

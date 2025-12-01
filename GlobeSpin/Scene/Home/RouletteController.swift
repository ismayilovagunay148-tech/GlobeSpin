//
//  RouletteController.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 01.12.25.
//

import UIKit

class RouletteController: BaseController {
    
    private let viewModel: RouletteViewModel
    
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Travel Roulette+"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Where to next?"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Tap the button to discover your next\nadventure"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let globeContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1.0, green: 0.92, blue: 0.8, alpha: 1.0)
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let globeImageView: UIImageView = {
        let iv = UIImageView()
        let config = UIImage.SymbolConfiguration(pointSize: 150, weight: .regular)
        iv.image = UIImage(systemName: "globe.americas.fill", withConfiguration: config)
        iv.tintColor = UIColor(red: 0.2, green: 0.6, blue: 0.8, alpha: 1.0)
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let spinButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("🎲  Spin the Globe", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 1.0, green: 0.45, blue: 0.35, alpha: 1.0)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let tabBarContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.85, green: 0.92, blue: 0.95, alpha: 1.0)
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let spinTabButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("🎯 Spin", for: .normal)
        button.setTitleColor(UIColor(red: 1.0, green: 0.45, blue: 0.35, alpha: 1.0), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let tripsTabButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("♥ My Trips", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let profileTabButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("👤 Profile", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(viewModel: RouletteViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        view.backgroundColor = UIColor(red: 0.53, green: 0.81, blue: 0.92, alpha: 1.0)
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        spinButton.addTarget(self, action: #selector(spinButtonTapped), for: .touchUpInside)
        spinTabButton.addTarget(self, action: #selector(spinTabTapped), for: .touchUpInside)
        tripsTabButton.addTarget(self, action: #selector(tripsTabTapped), for: .touchUpInside)
        profileTabButton.addTarget(self, action: #selector(profileTabTapped), for: .touchUpInside)
    }
    
    override func configureConstraints() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(headerLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(globeContainer)
        globeContainer.addSubview(globeImageView)
        contentView.addSubview(spinButton)
        
        view.addSubview(tabBarContainer)
        tabBarContainer.addSubview(spinTabButton)
        tabBarContainer.addSubview(tripsTabButton)
        tabBarContainer.addSubview(profileTabButton)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: tabBarContainer.topAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            
            titleLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            globeContainer.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 32),
            globeContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            globeContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            globeContainer.heightAnchor.constraint(equalTo: globeContainer.widthAnchor, multiplier: 1.0),
            
            globeImageView.centerXAnchor.constraint(equalTo: globeContainer.centerXAnchor),
            globeImageView.centerYAnchor.constraint(equalTo: globeContainer.centerYAnchor),
            globeImageView.widthAnchor.constraint(equalTo: globeContainer.widthAnchor, multiplier: 0.8),
            globeImageView.heightAnchor.constraint(equalTo: globeContainer.heightAnchor, multiplier: 0.8),
            
            spinButton.topAnchor.constraint(equalTo: globeContainer.bottomAnchor, constant: 32),
            spinButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            spinButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            spinButton.heightAnchor.constraint(equalToConstant: 56),
            spinButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
            
            tabBarContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tabBarContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tabBarContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            tabBarContainer.heightAnchor.constraint(equalToConstant: 70),
            
            spinTabButton.leadingAnchor.constraint(equalTo: tabBarContainer.leadingAnchor, constant: 20),
            spinTabButton.centerYAnchor.constraint(equalTo: tabBarContainer.centerYAnchor),
            spinTabButton.widthAnchor.constraint(equalTo: tabBarContainer.widthAnchor, multiplier: 0.28),
            
            tripsTabButton.centerXAnchor.constraint(equalTo: tabBarContainer.centerXAnchor),
            tripsTabButton.centerYAnchor.constraint(equalTo: tabBarContainer.centerYAnchor),
            tripsTabButton.widthAnchor.constraint(equalTo: tabBarContainer.widthAnchor, multiplier: 0.28),
            
            profileTabButton.trailingAnchor.constraint(equalTo: tabBarContainer.trailingAnchor, constant: -20),
            profileTabButton.centerYAnchor.constraint(equalTo: tabBarContainer.centerYAnchor),
            profileTabButton.widthAnchor.constraint(equalTo: tabBarContainer.widthAnchor, multiplier: 0.28)
        ])
    }
    
    override func configureViewModel() {
        viewModel.success = { [weak self] (countryName: String) in
            self?.showCountryResult(countryName)
        }
        
        viewModel.error = { [weak self] (errorMessage: String) in
            self?.showAlert(message: errorMessage)
        }
    }
    
    @objc private func spinButtonTapped() {
        // Add spin animation
        UIView.animate(withDuration: 0.1, animations: {
            self.spinButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                self.spinButton.transform = .identity
            }
        }
        
        // Rotate globe animation
        let rotation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.fromValue = 0
        rotation.toValue = Double.pi * 4
        rotation.duration = 2.0
        rotation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        globeImageView.layer.add(rotation, forKey: "rotation")
        
        viewModel.spinRoulette()
    }
    
    @objc private func spinTabTapped() {
        print("Spin tab tapped")
    }
    
    @objc private func tripsTabTapped() {
        print("Trips tab tapped")
    }
    
    @objc private func profileTabTapped() {
        print("Profile tab tapped")
    }
    
    private func showCountryResult(_ countryName: String) {
        let alert = UIAlertController(
            title: "🎉 Your Destination!",
            message: "You're going to \(countryName)!",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Awesome!", style: .default))
        present(alert, animated: true)
    }
}

//
//  RouletteController.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 01.12.25.
//

import UIKit

class RouletteController: BaseController {
    
    private let viewModel: RouletteViewModel
    
    private let gradientLayer = CAGradientLayer()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Travel Roulette+"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Where to next?"
        label.font = .systemFont(ofSize: 34, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Tap the button to discover your next\nadventure"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = UIColor.black.withAlphaComponent(0.6)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let globeContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1.0, green: 0.92, blue: 0.8, alpha: 1.0)
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.08
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let globeImageView: UIImageView = {
        let iv = UIImageView()
        let config = UIImage.SymbolConfiguration(pointSize: 180, weight: .regular)
        iv.image = UIImage(systemName: "globe.americas.fill", withConfiguration: config)
        iv.tintColor = UIColor(red: 0.4, green: 0.7, blue: 0.85, alpha: 1.0)
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = UIColor(red: 0.4, green: 0.7, blue: 0.85, alpha: 1.0)
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    private let spinButton: UIButton = {
        let button = UIButton(type: .system)
        
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = UIColor(red: 1.0, green: 0.45, blue: 0.35, alpha: 1.0)
        config.baseForegroundColor = .white
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 18, leading: 32, bottom: 18, trailing: 32)
        
        var container = AttributeContainer()
        container.font = .systemFont(ofSize: 18, weight: .semibold)
        config.attributedTitle = AttributedString("🌍 Spin the Globe", attributes: container)
        
        button.configuration = config
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.15
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradient()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }
    
    override func configureUI() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        spinButton.addTarget(self, action: #selector(spinButtonTapped), for: .touchUpInside)
    }
    
    private func setupGradient() {
        gradientLayer.colors = [
            UIColor(red: 0.53, green: 0.81, blue: 0.92, alpha: 1.0).cgColor,
            UIColor(red: 0.98, green: 0.87, blue: 0.72, alpha: 1.0).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func configureConstraints() {
        [headerLabel, titleLabel, subtitleLabel, globeContainer, spinButton].forEach {
            view.addSubview($0)
        }
        
        globeContainer.addSubview(globeImageView)
        globeContainer.addSubview(loadingIndicator)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            titleLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            globeContainer.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 25),
            globeContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            globeContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            globeContainer.heightAnchor.constraint(equalTo: globeContainer.widthAnchor, multiplier: 1.0),
            
            globeImageView.centerXAnchor.constraint(equalTo: globeContainer.centerXAnchor),
            globeImageView.centerYAnchor.constraint(equalTo: globeContainer.centerYAnchor),
            globeImageView.widthAnchor.constraint(equalTo: globeContainer.widthAnchor, multiplier: 0.75),
            globeImageView.heightAnchor.constraint(equalTo: globeContainer.heightAnchor, multiplier: 0.75),
            
            loadingIndicator.centerXAnchor.constraint(equalTo: globeContainer.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: globeContainer.centerYAnchor),
            
            spinButton.topAnchor.constraint(equalTo: globeContainer.bottomAnchor, constant: 50),
            spinButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinButton.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 32),
            spinButton.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -32),
            spinButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    override func configureViewModel() {
        viewModel.success = { [weak self] countryName in
            self?.showCountryResult(countryName)
        }
        
        viewModel.error = { [weak self] errorMessage in
            self?.showAlert(message: errorMessage)
        }
    }
    
    @objc private func spinButtonTapped() {
        UIView.animate(withDuration: 0.1, animations: {
            self.spinButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                self.spinButton.transform = .identity
            }
        }
        
        loadingIndicator.startAnimating()
        globeImageView.alpha = 0.3
        spinButton.isEnabled = false
        
        let rotation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.fromValue = 0
        rotation.toValue = Double.pi * 4
        rotation.duration = 2.0
        rotation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        globeImageView.layer.add(rotation, forKey: "rotation")
        
        viewModel.spinRoulette()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.loadingIndicator.stopAnimating()
            self?.globeImageView.alpha = 1.0
            self?.spinButton.isEnabled = true
        }
    }
    
    private func showCountryResult(_ countryName: String) {
        let alert = UIAlertController(
            title: "Your Destination!",
            message: "You're going to \(countryName)!",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Awesome!", style: .default))
        present(alert, animated: true)
    }
}

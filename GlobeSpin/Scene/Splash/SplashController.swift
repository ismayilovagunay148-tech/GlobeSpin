//
//  SplashController.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 11.11.25.
//

import UIKit

class SplashController: BaseController {
    
    private let viewModel: SplashViewModel
    private let coordinator: AppCoordinator

    private let gradientLayer = CAGradientLayer()

    private let circleContainer: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private let outerCircle: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        v.layer.borderWidth = 3
        v.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private let innerCircle: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        v.layer.borderWidth = 4
        v.layer.borderColor = UIColor.white.cgColor
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private let titleLabel: UILabel = {
        let l = UILabel()
        l.text = "Travel Roulette+"
        l.font = .systemFont(ofSize: 32, weight: .bold)
        l.textColor = .white
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let travelButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("Let's Travel!", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.backgroundColor = UIColor(red: 1, green: 0.42, blue: 0.42, alpha: 1)
        b.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        b.layer.cornerRadius = 25
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()

    init(viewModel: SplashViewModel, coordinator: AppCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) not implemented") }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradient()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimations()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
        outerCircle.layer.cornerRadius = outerCircle.bounds.width / 2
        innerCircle.layer.cornerRadius = innerCircle.bounds.width / 2
    }

    override func configureUI() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        travelButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    override func configureConstraints() {
        view.addSubview(circleContainer)
        view.addSubview(titleLabel)
        view.addSubview(travelButton)
        circleContainer.addSubview(outerCircle)
        circleContainer.addSubview(innerCircle)

        NSLayoutConstraint.activate([
            circleContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80),
            circleContainer.widthAnchor.constraint(equalToConstant: 200),
            circleContainer.heightAnchor.constraint(equalToConstant: 200),

            outerCircle.centerXAnchor.constraint(equalTo: circleContainer.centerXAnchor),
            outerCircle.centerYAnchor.constraint(equalTo: circleContainer.centerYAnchor),
            outerCircle.widthAnchor.constraint(equalToConstant: 200),
            outerCircle.heightAnchor.constraint(equalToConstant: 200),

            innerCircle.centerXAnchor.constraint(equalTo: circleContainer.centerXAnchor),
            innerCircle.centerYAnchor.constraint(equalTo: circleContainer.centerYAnchor),
            innerCircle.widthAnchor.constraint(equalToConstant: 160),
            innerCircle.heightAnchor.constraint(equalToConstant: 160),

            titleLabel.topAnchor.constraint(equalTo: circleContainer.bottomAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),

            travelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            travelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            travelButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            travelButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func setupGradient() {
        gradientLayer.colors = [
            UIColor(red: 0.29, green: 0.56, blue: 0.89, alpha: 1).cgColor,
            UIColor(red: 0.4, green: 0.8, blue: 0.8, alpha: 1).cgColor,
            UIColor(red: 0.6, green: 0.9, blue: 0.8, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    private func startAnimations() {
        let rotation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = Double.pi * 2
        rotation.duration = 8
        rotation.repeatCount = .infinity
        outerCircle.layer.add(rotation, forKey: "rotation")

        let pulse = CABasicAnimation(keyPath: "transform.scale")
        pulse.fromValue = 1
        pulse.toValue = 1.05
        pulse.duration = 2
        pulse.autoreverses = true
        pulse.repeatCount = .infinity
        innerCircle.layer.add(pulse, forKey: "pulse")

        titleLabel.alpha = 0
        UIView.animate(withDuration: 1, delay: 0.5) {
            self.titleLabel.alpha = 1
        }

        travelButton.alpha = 0
        travelButton.transform = CGAffineTransform(translationX: 0, y: 30)
        UIView.animate(withDuration: 0.8, delay: 1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5) {
            self.travelButton.alpha = 1
            self.travelButton.transform = .identity
        }
    }

    @objc private func buttonTapped() {
        UIView.animate(withDuration: 0.1, animations: {
            self.travelButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                self.travelButton.transform = .identity
            }
        }

        coordinator.showLogin()
    }
}


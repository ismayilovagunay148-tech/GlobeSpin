//
//  ProfileController.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 07.12.25.
//

import UIKit

class ProfileController: BaseController {
    
    private let viewModel: ProfileViewModel
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "person.circle.fill")
        iv.contentMode = .scaleAspectFill
        iv.tintColor = .systemGray3
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fullNameHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Fullname"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fullNameValueLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    
    private let fullNameSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emailHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailValueLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log Out", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.systemRed.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let config = UIImage.SymbolConfiguration(pointSize: 14, weight: .medium)
        let image = UIImage(systemName: "rectangle.portrait.and.arrow.right", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .systemRed
        
        return button
    }()
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Profile"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadUserData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
    }
    
    override func configureUI() {
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
    }
    
    override func configureConstraints() {
        [profileImageView, nameLabel, fullNameHeaderLabel, fullNameValueLabel,
         fullNameSeparator, emailHeaderLabel, emailValueLabel,
         emailSeparator, logoutButton].forEach { view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            fullNameHeaderLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 32),
            fullNameHeaderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            fullNameValueLabel.topAnchor.constraint(equalTo: fullNameHeaderLabel.bottomAnchor, constant: 8),
            fullNameValueLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            fullNameValueLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            fullNameSeparator.topAnchor.constraint(equalTo: fullNameValueLabel.bottomAnchor, constant: 16),
            fullNameSeparator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            fullNameSeparator.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            fullNameSeparator.heightAnchor.constraint(equalToConstant: 1),
            
            emailHeaderLabel.topAnchor.constraint(equalTo: fullNameSeparator.bottomAnchor, constant: 20),
            emailHeaderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            emailValueLabel.topAnchor.constraint(equalTo: emailHeaderLabel.bottomAnchor, constant: 8),
            emailValueLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            emailValueLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            emailSeparator.topAnchor.constraint(equalTo: emailValueLabel.bottomAnchor, constant: 16),
            emailSeparator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            emailSeparator.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            emailSeparator.heightAnchor.constraint(equalToConstant: 1),
            
            logoutButton.topAnchor.constraint(equalTo: emailSeparator.bottomAnchor, constant: 28),
            logoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            logoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            logoutButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    override func configureViewModel() {
        viewModel.userDataUpdated = { [weak self] fullName, email in
            print("ProfileController - Updating UI with name: \(fullName), email: \(email)")
            self?.updateUI(fullName: fullName, email: email)
        }
        
        viewModel.error = { [weak self] errorMessage in
            print("ProfileController - Error: \(errorMessage)")
            self?.showAlert(message: errorMessage)
        }
        
        viewModel.loading = { [weak self] isLoading in
            print("ProfileController - Loading: \(isLoading)")
        }
    }
    
    private func updateUI(fullName: String, email: String) {
        print("ProfileController - updateUI called with name: \(fullName), email: \(email)")
        nameLabel.text = fullName
        fullNameValueLabel.text = fullName
        emailValueLabel.text = email
    }
    
    @objc private func logoutButtonTapped() {
        showConfirmationAlert(
            title: "Log Out",
            message: "Are you sure you want to log out?",
            confirmTitle: "Log Out",
            confirmStyle: .destructive
        ) { [weak self] in
            self?.viewModel.logout()
        }
    }
}

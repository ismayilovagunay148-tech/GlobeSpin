//
//  LoginController.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 28.11.25.
//

import UIKit

class LoginController: BaseController {
    
    private let viewModel: LoginViewModel
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.text = "🌍 Travel Roulette+"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Discover random countries and explore\nthe world!"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var globeImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = UIColor(red: 0.2, green: 0.3, blue: 0.35, alpha: 1.0)
        iv.layer.cornerRadius = 16
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        let config = UIImage.SymbolConfiguration(pointSize: 80, weight: .light)
        iv.image = UIImage(systemName: "globe.americas.fill", withConfiguration: config)
        iv.tintColor = UIColor(red: 0.4, green: 0.7, blue: 0.7, alpha: 1.0)
        
        return iv
    }()
    
    private lazy var appleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("  Continue with Apple", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        button.layer.cornerRadius = 12
        
        let config = UIImage.SymbolConfiguration(pointSize: 18, weight: .semibold)
        let image = UIImage(systemName: "apple.logo", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        
        button.addTarget(self, action: #selector(appleButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var googleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("  Continue with Google", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        
        button.setImage(UIImage(systemName: "g.circle.fill"), for: .normal)
        button.tintColor = .systemBlue
        
        button.addTarget(self, action: #selector(googleButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = "or log in with email"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.font = .systemFont(ofSize: 15, weight: .regular)
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .white
        tf.autocapitalizationType = .none
        tf.keyboardType = .emailAddress
        tf.autocorrectionType = .no
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.font = .systemFont(ofSize: 15, weight: .regular)
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .white
        tf.isSecureTextEntry = true
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        
        let eyeButton = UIButton(type: .system)
        eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        eyeButton.tintColor = .gray
        eyeButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        tf.rightView = eyeButton
        tf.rightViewMode = .always
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Don't have an account? Sign Up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13)
        button.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.95, green: 0.97, blue: 0.99, alpha: 1.0)
        setupKeyboardDismissal()
    }
    
    override func configureUI() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func configureConstraints() {
        view.addSubview(contentStackView)
        
        [logoLabel, subtitleLabel, globeImageView, appleButton, googleButton,
         orLabel, emailTextField, passwordTextField,
         loginButton, signUpButton].forEach { contentStackView.addArrangedSubview($0) }

        NSLayoutConstraint.activate([
            contentStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            globeImageView.heightAnchor.constraint(equalToConstant: 150),
            
            appleButton.heightAnchor.constraint(equalToConstant: 50),
            googleButton.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        contentStackView.setCustomSpacing(6, after: logoLabel)
        contentStackView.setCustomSpacing(16, after: subtitleLabel)
        contentStackView.setCustomSpacing(20, after: globeImageView)
        contentStackView.setCustomSpacing(12, after: appleButton)
        contentStackView.setCustomSpacing(16, after: googleButton)
        contentStackView.setCustomSpacing(16, after: orLabel)
        contentStackView.setCustomSpacing(12, after: emailTextField)
        contentStackView.setCustomSpacing(28, after: passwordTextField)
        contentStackView.setCustomSpacing(14, after: loginButton)
    }
    
    override func configureViewModel() {
        viewModel.error = { [weak self] errorMessage in
            self?.showAlert(message: errorMessage)
        }
    }
    
    private func setupKeyboardDismissal() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func togglePasswordVisibility(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        let imageName = passwordTextField.isSecureTextEntry ? "eye.slash" : "eye"
        sender.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc private func appleButtonTapped() {
        print("Apple login tapped")
        viewModel.loginWithApple()
    }
    
    @objc private func googleButtonTapped() {
        print("Google login tapped")
        viewModel.loginWithGoogle()
    }
    
    @objc private func loginButtonTapped() {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showAlert(title: "Error", message: "Please enter both email and password")
            return
        }
        
        print("Login with email: \(email)")
        viewModel.loginWithEmail(email: email, password: password)
    }
    
    @objc private func signUpTapped() {
        viewModel.navigateToSignUp()
    }
}

//
//  SignUpController.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 28.11.25.
//

import UIKit

class SignUpController: BaseController {
    
    private let viewModel: SignUpViewModel
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 40
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let iv = UIImageView()
        let config = UIImage.SymbolConfiguration(pointSize: 32, weight: .semibold)
        iv.image = UIImage(systemName: "location.north.fill", withConfiguration: config)
        iv.tintColor = .white
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Create Your Account"
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Start your adventure around the world"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Full Name"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fullNameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter your full name"
        tf.borderStyle = .none
        tf.backgroundColor = UIColor.systemGray6
        tf.font = .systemFont(ofSize: 15)
        tf.autocapitalizationType = .words
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.systemGray4.cgColor
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: tf.frame.height))
        tf.leftView = paddingView
        tf.leftViewMode = .always
        tf.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: tf.frame.height))
        tf.rightViewMode = .always
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter your email address"
        tf.borderStyle = .none
        tf.backgroundColor = UIColor.systemGray6
        tf.font = .systemFont(ofSize: 15)
        tf.autocapitalizationType = .none
        tf.keyboardType = .emailAddress
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.systemGray4.cgColor
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: tf.frame.height))
        tf.leftView = paddingView
        tf.leftViewMode = .always
        tf.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: tf.frame.height))
        tf.rightViewMode = .always
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter your password"
        tf.borderStyle = .none
        tf.backgroundColor = UIColor.systemGray6
        tf.font = .systemFont(ofSize: 15)
        tf.isSecureTextEntry = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.systemGray4.cgColor
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: tf.frame.height))
        tf.leftView = paddingView
        tf.leftViewMode = .always
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let passwordToggleButton: UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
        button.setImage(UIImage(systemName: "eye.slash", withConfiguration: config), for: .normal)
        button.tintColor = .systemGray2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let confirmPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Confirm Password"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let confirmPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Confirm your password"
        tf.borderStyle = .none
        tf.backgroundColor = UIColor.systemGray6
        tf.font = .systemFont(ofSize: 15)
        tf.isSecureTextEntry = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.systemGray4.cgColor
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: tf.frame.height))
        tf.leftView = paddingView
        tf.leftViewMode = .always
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let confirmPasswordToggleButton: UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
        button.setImage(UIImage(systemName: "eye.slash", withConfiguration: config), for: .normal)
        button.tintColor = .systemGray2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var termsCheckbox: UIButton = {
        let button = UIButton(type: .custom)
        button.tintColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let normalImage = self.createCircleImage(filled: false)
        let selectedImage = self.createCircleImage(filled: true)
        
        button.setImage(normalImage, for: .normal)
        button.setImage(selectedImage, for: .selected)
        
        return button
    }()
    
    private func createCircleImage(filled: Bool) -> UIImage {
        let size = CGSize(width: 24, height: 24)
        let renderer = UIGraphicsImageRenderer(size: size)
        
        return renderer.image { context in
            let rect = CGRect(origin: .zero, size: size)
            let circlePath = UIBezierPath(ovalIn: rect.insetBy(dx: 2, dy: 2))
            
            UIColor.systemBlue.setStroke()
            circlePath.lineWidth = 2
            circlePath.stroke()
            
            if filled {
                let innerCircle = UIBezierPath(ovalIn: rect.insetBy(dx: 6, dy: 6))
                UIColor.systemBlue.setFill()
                innerCircle.fill()
            }
        }
    }
    
    private let termsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let text = "I agree to the Terms & Privacy"
        let attributedString = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: "Terms & Privacy")
        attributedString.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: range)
        label.attributedText = attributedString
        
        return label
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let loginTextLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let text = "Already have an account? Log In"
        let attributedString = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: "Log In")
        attributedString.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: range)
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 14, weight: .semibold), range: range)
        label.attributedText = attributedString
        
        return label
    }()
    
    init(viewModel: SignUpViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        view.backgroundColor = .systemBackground
        
        passwordTextField.rightView = passwordToggleButton
        passwordTextField.rightViewMode = .always
        
        confirmPasswordTextField.rightView = confirmPasswordToggleButton
        confirmPasswordTextField.rightViewMode = .always
        
        passwordToggleButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        confirmPasswordToggleButton.addTarget(self, action: #selector(toggleConfirmPasswordVisibility), for: .touchUpInside)
        termsCheckbox.addTarget(self, action: #selector(termsCheckboxTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
        let loginTapGesture = UITapGestureRecognizer(target: self, action: #selector(loginLabelTapped))
        loginTextLabel.isUserInteractionEnabled = true
        loginTextLabel.addGestureRecognizer(loginTapGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func configureConstraints() {
        iconContainer.addSubview(iconImageView)
        [iconContainer, titleLabel, subtitleLabel, fullNameLabel, fullNameTextField,
         emailLabel, emailTextField, passwordLabel, passwordTextField,
         confirmPasswordLabel, confirmPasswordTextField, termsCheckbox,
         termsLabel, signUpButton, loginTextLabel].forEach { view.addSubview($0) }

        NSLayoutConstraint.activate([
            iconContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            iconContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconContainer.widthAnchor.constraint(equalToConstant: 80),
            iconContainer.heightAnchor.constraint(equalToConstant: 80),
            
            iconImageView.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: iconContainer.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            fullNameLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 28),
            fullNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
            fullNameTextField.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 8),
            fullNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            fullNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            fullNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            emailLabel.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 14),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 14),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordToggleButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            passwordToggleButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -12),
            passwordToggleButton.widthAnchor.constraint(equalToConstant: 30),
            passwordToggleButton.heightAnchor.constraint(equalToConstant: 30),
            
            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 14),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
            confirmPasswordTextField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 8),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            confirmPasswordToggleButton.centerYAnchor.constraint(equalTo: confirmPasswordTextField.centerYAnchor),
            confirmPasswordToggleButton.trailingAnchor.constraint(equalTo: confirmPasswordTextField.trailingAnchor, constant: -12),
            confirmPasswordToggleButton.widthAnchor.constraint(equalToConstant: 30),
            confirmPasswordToggleButton.heightAnchor.constraint(equalToConstant: 30),
            
            termsCheckbox.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 16),
            termsCheckbox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            termsCheckbox.widthAnchor.constraint(equalToConstant: 24),
            termsCheckbox.heightAnchor.constraint(equalToConstant: 24),
            
            termsLabel.centerYAnchor.constraint(equalTo: termsCheckbox.centerYAnchor),
            termsLabel.leadingAnchor.constraint(equalTo: termsCheckbox.trailingAnchor, constant: 8),
            termsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            signUpButton.topAnchor.constraint(equalTo: termsCheckbox.bottomAnchor, constant: 20),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            signUpButton.heightAnchor.constraint(equalToConstant: 52),
            
            loginTextLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 16),
            loginTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    override func configureViewModel() {
        viewModel.error = { [weak self] errorMessage in
            self?.showAlert(message: errorMessage)
        }
    }
    
    @objc private func togglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()
        let imageName = passwordTextField.isSecureTextEntry ? "eye.slash" : "eye"
        let config = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
        passwordToggleButton.setImage(UIImage(systemName: imageName, withConfiguration: config), for: .normal)
    }
    
    @objc private func toggleConfirmPasswordVisibility() {
        confirmPasswordTextField.isSecureTextEntry.toggle()
        let imageName = confirmPasswordTextField.isSecureTextEntry ? "eye.slash" : "eye"
        let config = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
        confirmPasswordToggleButton.setImage(UIImage(systemName: imageName, withConfiguration: config), for: .normal)
    }
    
    @objc private func termsCheckboxTapped() {
        termsCheckbox.isSelected.toggle()
    }
    
    @objc private func signUpButtonTapped() {
        guard termsCheckbox.isSelected else {
            showAlert(message: "Please agree to the Terms & Privacy to continue")
            return
        }
        
        let fullName = fullNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let confirmPassword = confirmPasswordTextField.text ?? ""
        
        viewModel.signUpWithEmail(fullName: fullName, email: email, password: password, confirmPassword: confirmPassword)
    }
    
    @objc private func loginLabelTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

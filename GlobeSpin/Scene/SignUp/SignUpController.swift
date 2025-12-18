//
//  SignUpController.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 28.11.25.
//

import UIKit

class SignUpController: BaseController {
    
    private let viewModel: SignUpViewModel
    
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.showsVerticalScrollIndicator = false
        sv.keyboardDismissMode = .interactive
        return sv
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        tf.borderStyle = .roundedRect
        tf.backgroundColor = UIColor.systemGray6
        tf.font = .systemFont(ofSize: 15)
        tf.autocapitalizationType = .words
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
        tf.borderStyle = .roundedRect
        tf.backgroundColor = UIColor.systemGray6
        tf.font = .systemFont(ofSize: 15)
        tf.autocapitalizationType = .none
        tf.keyboardType = .emailAddress
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
        tf.borderStyle = .roundedRect
        tf.backgroundColor = UIColor.systemGray6
        tf.font = .systemFont(ofSize: 15)
        tf.isSecureTextEntry = true
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
        tf.borderStyle = .roundedRect
        tf.backgroundColor = UIColor.systemGray6
        tf.font = .systemFont(ofSize: 15)
        tf.isSecureTextEntry = true
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
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        button.tintColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let termsLabel: UILabel = {
        let label = UILabel()
        label.text = "I agree to the Terms & Privacy"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SignUp", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let loginTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Already have an account? LogIn"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func configureConstraints() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        iconContainer.addSubview(iconImageView)
        
        [iconContainer, titleLabel, subtitleLabel, fullNameLabel, fullNameTextField,
         emailLabel, emailTextField, passwordLabel, passwordTextField,
         confirmPasswordLabel, confirmPasswordTextField, termsCheckbox,
         termsLabel, signUpButton, loginTextLabel].forEach { contentView.addSubview($0) }

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            iconContainer.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 24),
            iconContainer.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            iconContainer.widthAnchor.constraint(equalToConstant: 80),
            iconContainer.heightAnchor.constraint(equalToConstant: 80),
            
            iconImageView.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: iconContainer.bottomAnchor, constant: 16),
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.85),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.85),
            subtitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            fullNameLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 28),
            fullNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            
            fullNameTextField.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 8),
            fullNameTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.85),
            fullNameTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            fullNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            emailLabel.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 14),
            emailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.85),
            emailTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 14),
            passwordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.85),
            passwordTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordToggleButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            passwordToggleButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -12),
            passwordToggleButton.widthAnchor.constraint(equalToConstant: 30),
            passwordToggleButton.heightAnchor.constraint(equalToConstant: 30),
            
            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 14),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            
            confirmPasswordTextField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 8),
            confirmPasswordTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.85),
            confirmPasswordTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            confirmPasswordToggleButton.centerYAnchor.constraint(equalTo: confirmPasswordTextField.centerYAnchor),
            confirmPasswordToggleButton.trailingAnchor.constraint(equalTo: confirmPasswordTextField.trailingAnchor, constant: -12),
            confirmPasswordToggleButton.widthAnchor.constraint(equalToConstant: 30),
            confirmPasswordToggleButton.heightAnchor.constraint(equalToConstant: 30),
            
            termsCheckbox.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 16),
            termsCheckbox.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            termsCheckbox.widthAnchor.constraint(equalToConstant: 24),
            termsCheckbox.heightAnchor.constraint(equalToConstant: 24),
            
            termsLabel.centerYAnchor.constraint(equalTo: termsCheckbox.centerYAnchor),
            termsLabel.leadingAnchor.constraint(equalTo: termsCheckbox.trailingAnchor, constant: 8),
            termsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            
            signUpButton.topAnchor.constraint(equalTo: termsCheckbox.bottomAnchor, constant: 20),
            signUpButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.85),
            signUpButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: 52),
            
            loginTextLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 16),
            loginTextLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loginTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
        ])
    }
    
    override func configureViewModel() {
        viewModel.error = { [weak self] errorMessage in
            self?.showAlert(message: errorMessage)
        }
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = .zero
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
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

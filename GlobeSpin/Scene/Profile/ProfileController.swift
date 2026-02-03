//
//  ProfileController.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 07.12.25.
//

import UIKit

class ProfileController: BaseController {
    
    private let viewModel: ProfileViewModel
    private var isEditingName = false
    
    private var fullNameCardTopConstraint: NSLayoutConstraint?
    
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.showsVerticalScrollIndicator = false
        sv.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.0)
        return sv
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "person.circle.fill")
        iv.contentMode = .scaleAspectFill
        iv.tintColor = .systemGray3
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let nameStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
    
    private let nameTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 20, weight: .semibold)
        tf.textColor = .label
        tf.textAlignment = .center
        tf.borderStyle = .roundedRect
        tf.isHidden = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let editButton: UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 16, weight: .medium)
        let image = UIImage(systemName: "pencil.circle.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .systemGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let editActionsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 12
        stack.distribution = .fillEqually
        stack.isHidden = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 14, weight: .medium)
        let image = UIImage(systemName: "checkmark.circle.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 14, weight: .medium)
        let image = UIImage(systemName: "xmark.circle.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let fullNameCardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.05
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let fullNameHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Full Name"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fullNameValueLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailCardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.05
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emailHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailValueLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.0)
        title = "Profile"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
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
        editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
        nameTextField.delegate = self
    }
    
    override func configureConstraints() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        nameStackView.addArrangedSubview(nameLabel)
        nameStackView.addArrangedSubview(editButton)
        
        editActionsStackView.addArrangedSubview(saveButton)
        editActionsStackView.addArrangedSubview(cancelButton)
        
        fullNameCardView.addSubview(fullNameHeaderLabel)
        fullNameCardView.addSubview(fullNameValueLabel)
        
        emailCardView.addSubview(emailHeaderLabel)
        emailCardView.addSubview(emailValueLabel)
        
        [profileImageView, nameStackView, nameTextField, editActionsStackView,
         fullNameCardView, emailCardView, logoutButton].forEach { contentView.addSubview($0) }
        
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
            
            profileImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 40),
            profileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor),
            
            nameStackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            nameStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            editButton.widthAnchor.constraint(equalToConstant: 24),
            editButton.heightAnchor.constraint(equalToConstant: 24),
            
            nameTextField.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            nameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            nameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            editActionsStackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 62),
            editActionsStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            editActionsStackView.widthAnchor.constraint(equalToConstant: 80),
            
            saveButton.widthAnchor.constraint(equalToConstant: 34),
            saveButton.heightAnchor.constraint(equalToConstant: 34),
            cancelButton.widthAnchor.constraint(equalToConstant: 34),
            cancelButton.heightAnchor.constraint(equalToConstant: 34),
            
            fullNameCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            fullNameCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            fullNameCardView.heightAnchor.constraint(equalToConstant: 80),
            
            fullNameHeaderLabel.topAnchor.constraint(equalTo: fullNameCardView.topAnchor, constant: 16),
            fullNameHeaderLabel.leadingAnchor.constraint(equalTo: fullNameCardView.leadingAnchor, constant: 16),
            
            fullNameValueLabel.topAnchor.constraint(equalTo: fullNameHeaderLabel.bottomAnchor, constant: 8),
            fullNameValueLabel.leadingAnchor.constraint(equalTo: fullNameCardView.leadingAnchor, constant: 16),
            fullNameValueLabel.trailingAnchor.constraint(equalTo: fullNameCardView.trailingAnchor, constant: -16),
            
            emailCardView.topAnchor.constraint(equalTo: fullNameCardView.bottomAnchor, constant: 16),
            emailCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            emailCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            emailCardView.heightAnchor.constraint(equalToConstant: 80),
            
            emailHeaderLabel.topAnchor.constraint(equalTo: emailCardView.topAnchor, constant: 16),
            emailHeaderLabel.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 16),
            
            emailValueLabel.topAnchor.constraint(equalTo: emailHeaderLabel.bottomAnchor, constant: 8),
            emailValueLabel.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 16),
            emailValueLabel.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -16),
            
            logoutButton.topAnchor.constraint(equalTo: emailCardView.bottomAnchor, constant: 28),
            logoutButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            logoutButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoutButton.heightAnchor.constraint(equalToConstant: 50),
            logoutButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
        ])
        
        fullNameCardTopConstraint = fullNameCardView.topAnchor.constraint(equalTo: nameStackView.bottomAnchor, constant: 32)
        fullNameCardTopConstraint?.isActive = true
    }
    
    override func configureViewModel() {
        viewModel.viewState = { [weak self] state in
            self?.handleViewState(state)
        }
    }
    
    private func handleViewState(_ state: ProfileViewModel.ViewState) {
        switch state {
        case .idle:
            break
        case .loading:
            break
        case .success(let fullName, let email):
            updateUI(fullName: fullName, email: email)
        case .error(let errorMessage):
            showAlert(message: errorMessage)
        case .updateSuccess:
            showSuccessAlert(message: "Your name has been updated")
            setEditMode(false)
            viewModel.loadUserData(forceRefresh: true)
        }
    }
    
    private func updateUI(fullName: String, email: String) {
        nameLabel.text = fullName
        nameTextField.text = fullName
        fullNameValueLabel.text = fullName
        emailValueLabel.text = email
    }
    
    private func setEditMode(_ editing: Bool) {
        isEditingName = editing
        
        UIView.animate(withDuration: 0.3) {
            self.nameStackView.isHidden = editing
            self.nameTextField.isHidden = !editing
            self.editActionsStackView.isHidden = !editing
            
            self.fullNameCardTopConstraint?.isActive = false
            if editing {
                self.fullNameCardTopConstraint = self.fullNameCardView.topAnchor.constraint(equalTo: self.editActionsStackView.bottomAnchor, constant: 20)
            } else {
                self.fullNameCardTopConstraint = self.fullNameCardView.topAnchor.constraint(equalTo: self.nameStackView.bottomAnchor, constant: 32)
            }
            self.fullNameCardTopConstraint?.isActive = true
            self.view.layoutIfNeeded()
        }
        
        if editing {
            nameTextField.becomeFirstResponder()
        } else {
            nameTextField.resignFirstResponder()
        }
    }
    
    @objc private func editButtonTapped() {
        setEditMode(true)
    }
    
    @objc private func saveButtonTapped() {
        guard let newName = nameTextField.text?.trimmingCharacters(in: .whitespaces),
              !newName.isEmpty else {
            showAlert(message: "Please enter a valid name")
            return
        }
        
        viewModel.updateUserName(newName: newName)
    }
    
    @objc private func cancelButtonTapped() {
        nameTextField.text = nameLabel.text
        setEditMode(false)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
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

extension ProfileController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveButtonTapped()
        return true
    }
}

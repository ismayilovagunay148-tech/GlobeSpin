//
//  EditProfileController.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 28.01.26.
//

import UIKit

class EditProfileController: BaseController {

    private let viewModel: ProfileViewModel
    private let imageStorageService = ImageStorageService.shared
    private let authService = AuthService.shared

    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.showsVerticalScrollIndicator = false
        sv.keyboardDismissMode = .interactive
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        let config = UIImage.SymbolConfiguration(pointSize: 60, weight: .regular)
        iv.image = UIImage(systemName: "person.fill", withConfiguration: config)
        iv.tintColor = .white
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private lazy var editPictureButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit Picture", for: .normal)
        button.setTitleColor(UIColor(red: 0.4, green: 0.6, blue: 1.0, alpha: 1.0), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.addTarget(self, action: #selector(editPictureTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Full Name"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let fullNameTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 16, weight: .medium)
        tf.textColor = .black
        tf.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        tf.autocapitalizationType = .words
        tf.autocorrectionType = .no
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 50))
        tf.leftView = padding
        tf.leftViewMode = .always
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 16, weight: .medium)
        tf.textColor = .gray
        tf.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        tf.isEnabled = false
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 50))
        tf.leftView = padding
        tf.leftViewMode = .always
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save Changes", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 1.0, alpha: 1.0)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .gray
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
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
        viewModel.loadUserData()
        loadProfileImage()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
    }

    override func configureUI() {
        navigationItem.title = ""
        navigationController?.navigationBar.prefersLargeTitles = false

        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.setTitle(" Profile", for: .normal)
        backButton.tintColor = UIColor(red: 0.4, green: 0.6, blue: 1.0, alpha: 1.0)
        backButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    override func configureConstraints() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        view.addSubview(loadingIndicator)

        [profileImageView, editPictureButton, fullNameLabel, fullNameTextField,
         emailLabel, emailTextField, saveButton].forEach { contentView.addSubview($0) }

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

            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            profileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 140),
            profileImageView.heightAnchor.constraint(equalToConstant: 140),

            editPictureButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 12),
            editPictureButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            fullNameLabel.topAnchor.constraint(equalTo: editPictureButton.bottomAnchor, constant: 40),
            fullNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),

            fullNameTextField.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 8),
            fullNameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            fullNameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            fullNameTextField.heightAnchor.constraint(equalToConstant: 50),

            emailLabel.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 24),
            emailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),

            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),

            saveButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 40),
            saveButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            saveButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),

            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    override func configureViewModel() {
        viewModel.viewState = { [weak self] state in
            self?.handleState(state)
        }
    }

    private func handleState(_ state: ProfileViewModel.ViewState) {
        switch state {
        case .idle:
            break

        case .loading:
            loadingIndicator.startAnimating()
            saveButton.isEnabled = false

        case .success(let fullName, let email):
            loadingIndicator.stopAnimating()
            saveButton.isEnabled = true
            fullNameTextField.text = fullName
            emailTextField.text = email

        case .error(let message):
            loadingIndicator.stopAnimating()
            saveButton.isEnabled = true
            showAlert(message: message)

        case .updateSuccess:
            loadingIndicator.stopAnimating()
            saveButton.isEnabled = true
            showSuccessAlert(message: "Profile updated successfully!") { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            }
        }
    }

    private func loadProfileImage() {
        guard let userId = authService.getCurrentUserId() else { return }

        imageStorageService.downloadProfileImage(userId: userId) { [weak self] image, _ in
            DispatchQueue.main.async {
                if let image = image {
                    self?.profileImageView.image = image
                }
            }
        }
    }

    private func uploadProfileImage(_ image: UIImage) {
        guard let userId = authService.getCurrentUserId() else { return }

        loadingIndicator.startAnimating()
        saveButton.isEnabled = false

        imageStorageService.uploadProfileImage(userId: userId, image: image) { [weak self] error in
            DispatchQueue.main.async {
                self?.loadingIndicator.stopAnimating()
                self?.saveButton.isEnabled = true

                if let error = error {
                    self?.showAlert(message: "Failed to upload image: \(error.localizedDescription)")
                } else {
                    self?.showSuccessAlert(message: "Profile picture updated successfully!") {
                        self?.loadProfileImage()
                    }
                }
            }
        }
    }

    @objc private func editPictureTapped() {
        let alert = UIAlertController(title: "Change Profile Picture", message: "Choose an option", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Take Photo", style: .default) { [weak self] _ in
            self?.openCamera()
        })
        alert.addAction(UIAlertAction(title: "Choose from Library", style: .default) { [weak self] _ in
            self?.openPhotoLibrary()
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }

    private func openCamera() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            showAlert(message: "Camera is not available on this device")
            return
        }
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }

    private func openPhotoLibrary() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }

    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func saveButtonTapped() {
        guard let newName = fullNameTextField.text?.trimmingCharacters(in: .whitespaces),
              !newName.isEmpty else {
            showAlert(message: "Please enter your name")
            return
        }

        guard newName.count >= 2 else {
            showAlert(message: "Name must be at least 2 characters")
            return
        }

        viewModel.updateUserName(newName: newName)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
        scrollView.contentInset = insets
        scrollView.scrollIndicatorInsets = insets
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = .zero
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension EditProfileController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true)
        let image = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage
        if let image = image {
            profileImageView.image = image
            uploadProfileImage(image)
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

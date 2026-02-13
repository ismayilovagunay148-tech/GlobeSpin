//
//  ProfileController.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 07.12.25.
//

import UIKit

class ProfileController: BaseController {

    private let viewModel: ProfileViewModel
    private let imageStorageService = ImageStorageService.shared
    private let authService = AuthService.shared

    private struct MenuItem {
        let icon: UIImage?
        let title: String
        let action: () -> Void
    }

    private var menuItems: [MenuItem] = []

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.backgroundColor = .white
        tv.separatorStyle = .none
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    private lazy var logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log Out", for: .normal)
        button.setTitleColor(UIColor(red: 0.9, green: 0.3, blue: 0.3, alpha: 1.0), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.9, green: 0.3, blue: 0.3, alpha: 1.0).cgColor
        button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
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
        setupMenuItems()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        viewModel.loadUserData()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
    }

    override func configureUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.identifier)
    }

    override func configureConstraints() {
        let headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false

        [titleLabel, profileImageView, nameLabel].forEach { headerView.addSubview($0) }

        view.addSubview(headerView)
        view.addSubview(tableView)
        view.addSubview(logoutButton)
        view.addSubview(loadingIndicator)

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),

            profileImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            profileImageView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 140),
            profileImageView.heightAnchor.constraint(equalToConstant: 140),

            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 24),
            nameLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -24),
            nameLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),

            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 50),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            tableView.bottomAnchor.constraint(equalTo: logoutButton.topAnchor, constant: -24),

            logoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            logoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            logoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150),
            logoutButton.heightAnchor.constraint(equalToConstant: 50),

            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    override func configureViewModel() {
        viewModel.viewState = { [weak self] state in
            self?.handleViewState(state)
        }
    }

    private func setupMenuItems() {
        menuItems = [
            MenuItem(icon: UIImage(systemName: "person.fill"), title: "Profile") { [weak self] in
                self?.viewModel.navigateToEditProfile()
            },
            MenuItem(icon: UIImage(systemName: "doc.text.fill"), title: "Terms of service") { [weak self] in
                self?.viewModel.navigateToTermsOfService()
            },
            MenuItem(icon: UIImage(systemName: "shield.fill"), title: "Privacy") { [weak self] in
                self?.viewModel.navigateToPrivacyPolicy()
            }
        ]
    }

    private func handleViewState(_ state: ProfileViewModel.ViewState) {
        switch state {
        case .idle:
            break

        case .loading:
            loadingIndicator.startAnimating()

        case .success(let fullName, _):
            loadingIndicator.stopAnimating()
            nameLabel.text = fullName
            loadProfileImage()

        case .error(let message):
            loadingIndicator.stopAnimating()
            showAlert(message: message)

        case .updateSuccess:
            loadingIndicator.stopAnimating()
            viewModel.loadUserData(forceRefresh: true)
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

extension ProfileController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.identifier, for: indexPath) as? ProfileCell else {
            return UITableViewCell()
        }
        let item = menuItems[indexPath.row]
        cell.configure(icon: item.icon, title: item.title)
        return cell
    }
}

extension ProfileController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        menuItems[indexPath.row].action()
    }
}

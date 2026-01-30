//
//  CountryDetailController.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 20.12.25.
//

import UIKit

class CountryDetailController: BaseController {
    
    private let viewModel: CountryDetailViewModel
    private let favoritesManager = FavoritesManager.shared
    private let authService = AuthService.shared
    
    private let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.backgroundColor = .systemBackground
        tv.separatorStyle = .none
        tv.showsVerticalScrollIndicator = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    init(viewModel: CountryDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func configureUI() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CountryDetailCell.self, forCellReuseIdentifier: CountryDetailCell.identifier)
    }
    
    override func configureConstraints() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func addToFavorites() {
        guard let userId = authService.getCurrentUserId() else {
            showAlert(message: "Please log in to save favorites")
            return
        }
        
        let country = viewModel.getCountry()
        
        favoritesManager.addFavorite(userId: userId, country: country) { [weak self] error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.showAlert(message: "Failed to save: \(error.localizedDescription)")
                } else {
                    self?.showAlert(
                        title: "Added to My Trips! 🎉",
                        message: "\(country.name) has been added to your travel list."
                    )
                }
            }
        }
    }
}

extension CountryDetailController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryDetailCell.identifier, for: indexPath) as? CountryDetailCell else {
            return UITableViewCell()
        }
        
        cell.configure(country: viewModel.getCountry())
        
        cell.yesButtonAction = { [weak self] in
            self?.addToFavorites()
        }
        
        cell.spinAgainButtonAction = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        return cell
    }
}

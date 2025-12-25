//
//  CountryDetailController.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 20.12.25.
//

import UIKit

class CountryDetailController: BaseController {
    
    private let viewModel: CountryDetailViewModel
    
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
    
    override func configureUI() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        
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
}

extension CountryDetailController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryDetailCell.identifier, for: indexPath) as! CountryDetailCell
        
        cell.configure(country: viewModel.getCountry())
        
        cell.backButtonAction = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        cell.yesButtonAction = { [weak self] in
            guard let self = self else { return }
            self.showAlert(
                title: "Great Choice!",
                message: "We'll remember your interest in \(self.viewModel.getCountryName())!"
            )
        }
        
        cell.spinAgainButtonAction = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        return cell
    }
}

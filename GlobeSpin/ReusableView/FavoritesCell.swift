//
//  FavoritesCell.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 27.12.25.
//

import UIKit
import Alamofire

class FavoritesCell: UICollectionViewCell {
    
    static let identifier = "FavoritesCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 8
        view.layer.shadowOpacity = 0.1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let countryImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .systemGray5
        iv.layer.cornerRadius = 12
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let countryNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let capitalLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(containerView)
        containerView.addSubview(countryImageView)
        containerView.addSubview(countryNameLabel)
        containerView.addSubview(capitalLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            countryImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            countryImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            countryImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            countryImageView.heightAnchor.constraint(equalTo: countryImageView.widthAnchor, multiplier: 0.65),
            
            countryNameLabel.topAnchor.constraint(equalTo: countryImageView.bottomAnchor, constant: 10),
            countryNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            countryNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            
            capitalLabel.topAnchor.constraint(equalTo: countryNameLabel.bottomAnchor, constant: 2),
            capitalLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            capitalLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            capitalLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12)
        ])
    }
    
    func configure(with country: Country) {
        countryNameLabel.text = country.name
        capitalLabel.text = country.capital
        loadImage(from: country.imageURL)
    }
    
    private func loadImage(from urlString: String) {
        countryImageView.image = nil
        countryImageView.backgroundColor = .systemGray5
        
        guard let url = URL(string: urlString) else { return }
        
        AF.request(url).responseData { [weak self] response in
            switch response.result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.countryImageView.image = UIImage(data: data)
                }
            case .failure:
                DispatchQueue.main.async {
                    self?.countryImageView.backgroundColor = .systemGray5
                }
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        countryImageView.image = nil
        countryImageView.backgroundColor = .systemGray5
        countryNameLabel.text = nil
        capitalLabel.text = nil
    }
}

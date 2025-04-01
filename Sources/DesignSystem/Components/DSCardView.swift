//
//  Untitled.swift
//  DesignSystem
//
//  Created by walid on 31/3/2025.
//

import UIKit

public class DSCardView: UIView {
    
    
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = DSTypography.titleFont
        label.textColor = DSColors.textPrimary
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let birthdayLabel: UILabel = {
        let label = UILabel()
        label.font = DSTypography.bodyFont
        label.textColor = DSColors.textSecondary
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.font = DSTypography.bodyFont
        label.textColor = DSColors.textSecondary
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.font = DSTypography.bodyFont
        label.textColor = DSColors.textSecondary
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = DSTypography.bodyFont
        label.textColor = DSColors.textSecondary
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var containerView: UIStackView = {
         let stackView = UIStackView(arrangedSubviews: [profileImageView, infoStackView])
         stackView.axis = .horizontal
         stackView.spacing = 16
         stackView.alignment = .center
         stackView.translatesAutoresizingMaskIntoConstraints = false
         return stackView
     }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = DSColors.third
        layer.cornerRadius = 10
        layer.shadowColor = DSColors.textPrimary.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 4
        addSubview(containerView)
        containerView.addSubview(profileImageView)
        containerView.addSubview(infoStackView)
        
        infoStackView.addArrangedSubview(nameLabel)
        infoStackView.addArrangedSubview(birthdayLabel)
        infoStackView.addArrangedSubview(emailLabel)
        infoStackView.addArrangedSubview(phoneLabel)
        infoStackView.addArrangedSubview(locationLabel)
        
        setupConstraints()

    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Container View
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            
            
            profileImageView.widthAnchor.constraint(equalToConstant: 60),
            profileImageView.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    public func configure(name: String, birthday: String, email: String, phone: String, imageURL: String?, location: String) {
        nameLabel.text = name
        birthdayLabel.text = birthday
        emailLabel.text = email
        phoneLabel.text = phone
        locationLabel.text = location
        if let imageURL = imageURL, let url = URL(string: imageURL) {
            loadImage(from: url)
        } else {
            profileImageView.image = UIImage(systemName: "person.circle") 
        }
    }
    
    public func configureDetail(name: String, imageURL: String?) {
        nameLabel.text = name
        if let imageURL = imageURL, let url = URL(string: imageURL) {
            loadImage(from: url)
        } else {
            profileImageView.image = UIImage(systemName: "person.circle")
        }
    }
    
    private func loadImage(from url: URL) {
          DispatchQueue.global().async {
              if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                  DispatchQueue.main.async {
                      self.profileImageView.image = image
                  }
              }
          }
      }
}

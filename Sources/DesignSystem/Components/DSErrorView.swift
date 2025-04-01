//
//  Untitled.swift
//  DesignSystem
//
//  Created by walid on 31/3/2025.
//

import UIKit

public class DSErrorView: UIView {
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = DSColors.error
        label.font = DSTypography.bodyFont
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let retryButton: DSButton = {
        let button = DSButton(title: "Réessayer") { }
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var retryAction: (() -> Void)?
    
    public init(message: String, retryAction: (() -> Void)? = nil) {
        self.retryAction = retryAction
        super.init(frame: .zero)
        setupUI(message: message)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(message: String) {
        backgroundColor = DSColors.third
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 6
        
        messageLabel.text = message
        retryButton.addTarget(self, action: #selector(retryTapped), for: .touchUpInside)
        
        addSubview(messageLabel)
        addSubview(retryButton)
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            retryButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20),
            retryButton.widthAnchor.constraint(equalToConstant: 200),
            retryButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            retryButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    @objc private func retryTapped() {
        retryAction?()
    }
}

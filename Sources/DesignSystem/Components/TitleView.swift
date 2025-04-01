//
//  Untitled.swift
//  DesignSystem
//
//  Created by walid on 31/3/2025.
//

import UIKit

public class TitleView: UIView {
    
    // MARK: - UI Elements
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = DSColors.textPrimary
        label.font = DSTypography.titleFont
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    // MARK: - Initializers
    public init(title: String) {
        super.init(frame: .zero)
        self.titleLabel.text = title
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupView() {
        backgroundColor = .clear
        addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

    }
    
    // MARK: - Public Method
    public func setTitle(_ title: String) {
        titleLabel.text = title
    }
}

//
//  Untitled.swift
//  DesignSystem
//
//  Created by walid on 31/3/2025.
//

import UIKit

public class DSButton: UIButton {
    public init(title: String, action: @escaping () -> Void) {
        super.init(frame: .zero)
        setupUI(title: title, action: action)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI(title: String, action: @escaping () -> Void) {
        setTitle(title, for: .normal)
        titleLabel?.font = DSTypography.buttonFont
        backgroundColor = DSColors.primary
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 8
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.action = action
    }

    private var action: (() -> Void)?

    @objc private func buttonTapped() {
        action?()
    }
}

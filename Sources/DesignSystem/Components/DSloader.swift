//
//  Untitled.swift
//  DesignSystem
//
//  Created by walid on 1/4/2025.
//

import UIKit
import Foundation

@MainActor
public class LoaderManager {
   public  static let shared = LoaderManager()

    private var spinner: UIActivityIndicatorView?

    public init() {}

    public func showLoader(on view: UIView) {
        DispatchQueue.main.async {
            if self.spinner == nil {
                let spinner = UIActivityIndicatorView(style: .large)
                spinner.center = view.center
                spinner.color = .gray
                spinner.startAnimating()
                
                view.addSubview(spinner)
                self.spinner = spinner
            }
        }
    }

    public func hideLoader() {
        DispatchQueue.main.async {
            self.spinner?.stopAnimating()
            self.spinner?.removeFromSuperview()
            self.spinner = nil
        }
    }
}

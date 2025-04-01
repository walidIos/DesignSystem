//
//  Untitled.swift
//  DesignSystem
//
//  Created by walid on 27/3/2025.
//
import UIKit

public class DSColors {
    
    // MARK: - Primary Colors
    public static let primary = UIColor(hex: "#007AFF")  // Bleu iOS par défaut
    public static let secondary = UIColor(hex: "#34C759") // Vert iOS
    public static let third =  UIColor(hex: "#FFFFFF")
    // MARK: - Neutral Colors
    public static let background = UIColor(hex: "#F5F5F5") // Gris clair
    public static let textPrimary = UIColor(hex: "#1C1C1E") // Noir
    public static let textSecondary = UIColor(hex: "#8E8E93") // Gris
    
    // MARK: - Error & Success Colors
    public static let error = UIColor(hex: "#FF3B30")  // Rouge
    public static let success = UIColor(hex: "#4CD964") // Vert de validation
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexSanitized.hasPrefix("#") {
            hexSanitized.removeFirst()
        }
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb >> 16) & 0xFF) / 255.0
        let green = CGFloat((rgb >> 8) & 0xFF) / 255.0
        let blue = CGFloat(rgb & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

//
//  Extention + UIView.swift
//  DataPicker
//
//  Created by 1 on 01.10.2021.
//

import Foundation
import UIKit

extension UIView {
    func addGradientColor(topColor: UIColor, buttomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, buttomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}

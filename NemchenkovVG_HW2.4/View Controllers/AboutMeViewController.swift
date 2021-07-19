//
//  AboutMeViewController.swift
//  NemchenkovVG_HW2.4
//
//  Created by Владимир Немченков on 18.07.2021.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    @IBOutlet weak var aboutMeLabel: UILabel!
    
    var aboutMeText = ""
    
    private let primaryColor = UIColor.orange
    private let secondaryColor = UIColor.systemTeal
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayerForAbouMeVC(topColor: primaryColor, bottomColor: secondaryColor)
        aboutMeLabel.text = "Hello, I Am \(aboutMeText)"
    }
}

// MARK: - Gradient Color
extension UIView {
    func addVerticalGradientLayerForAbouMeVC(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}


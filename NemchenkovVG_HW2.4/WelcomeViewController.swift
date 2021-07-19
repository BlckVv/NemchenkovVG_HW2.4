//
//  WelcomeViewController.swift
//  NemchenkovVG_HW2.4
//
//  Created by Владимир Немченков on 17.07.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var welcomeUserText = ""
    
    private let primaryColor = UIColor.blue
    private let secondaryColor = UIColor.black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayerForWelcomeVC(topColor: primaryColor, bottomColor: secondaryColor)
        welcomeLabel.text = "Welcome, \(welcomeUserText)"
    }
}

// MARK: - Gradient Color
extension UIView {
    func addVerticalGradientLayerForWelcomeVC(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}


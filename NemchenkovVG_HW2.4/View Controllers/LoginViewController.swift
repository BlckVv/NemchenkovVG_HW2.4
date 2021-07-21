//
//  ViewController.swift
//  NemchenkovVG_HW2.4
//
//  Created by Владимир Немченков on 17.07.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    let me = User()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let tabBarController = segue.destination as! UITabBarController
        
        if let viewControllers = tabBarController.viewControllers {
            
            for viewController in viewControllers {
                if let welcomeVC = viewController as? WelcomeViewController {
                    welcomeVC.welcomeUserText = "\(me.name) \(me.surname)!"
                } else if let navigationVC = viewController as? UINavigationController {
                    let aboutMeVC = navigationVC.topViewController as! AboutMeViewController
                    aboutMeVC.aboutMeText = """
                                                Hello, I Am \(me.name) \(me.surname),
                                                my friends calls me \(me.nickname)
                                                and I am \(me.age) y.o.
                                            """
                    title = "\(me.name) \(me.surname)"
                }
            }
        }
    }
    
    @IBAction func loginButtonPressed() {
        if userNameTF.text != me.login || passwordTF.text != me.password {
            showAlert(title: "Oops!", message: "Wrong username or password. Try again.")
            self.passwordTF.text = ""
        }
    }
    
    @IBAction func forgotUserNameButtonPressed() {
        showAlert(title: "Oops!", message: "Your user name is User")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(title: "Oops!", message: "Your password is '123456' ")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}




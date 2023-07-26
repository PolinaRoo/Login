//
//  ViewController.swift
//  Login
//
//  Created by Polina Tereshchenko on 24.07.2023.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var envelopImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var emailLine: UIView!
    @IBOutlet weak var passwordLine: UIView!
    @IBOutlet weak var dontHaveAnAccountLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureLoginButton()
    }
    
    //MARK: - Actions
    @IBAction func loginButtonAction(_ sender: Any) {
    }
    
    @IBAction func signUpButtonAction(_ sender: Any) {
    }
    
    
    // MARK: Methods
    private func configureLoginButton() {
        loginButton.layer.shadowColor = (UIColor(named: "orange") ?? UIColor.darkGray).cgColor
        loginButton.layer.shadowOffset = CGSize(width: 4, height: 6)
        loginButton.layer.shadowOpacity = 0.5
        loginButton.layer.shadowRadius = 5
    }
}


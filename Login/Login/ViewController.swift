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
    
    //MARK: Properties
    private let activeColor = UIColor(named: "orange") ?? UIColor.darkGray
    private var email: String = "" {
        didSet {
            loginButton.isUserInteractionEnabled = !(email.isEmpty || password.isEmpty)
            loginButton.backgroundColor = !(email.isEmpty || password.isEmpty) ? activeColor : .systemGray3
        }
    }
    private var password: String = "" {
        didSet {
            loginButton.isUserInteractionEnabled = !(email.isEmpty || password.isEmpty)
            loginButton.backgroundColor = !(email.isEmpty || password.isEmpty) ? activeColor : .systemGray3
        }
    }
    
    private let mockEmail = "abc@gmail.com"
    private let mockPassword = "123456"
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureLoginButton()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.becomeFirstResponder() //должен стать активным этот филд
    }
    
    //MARK: - Actions
    @IBAction func loginButtonAction(_ sender: Any) {
        passwordTextField.resignFirstResponder() //перестать быть активным текст филду
        emailTextField.resignFirstResponder()
        
        if email.isEmpty {
            makeErrorField(textField: emailTextField)
        }
        
        if password.isEmpty {
            makeErrorField(textField: passwordTextField)
        }
        
        if email == mockEmail,
           password == mockPassword {
            performSegue(withIdentifier: "goToHomePage", sender: sender)
        } else {
            let alert = UIAlertController(title: "Error".localized,
                                          message: "Wrong password or email".localized,
                                          preferredStyle: .alert)
            let action = UIAlertAction(title: "OK".localized , style: .default)
            alert.addAction(action)
            
            present(alert, animated: true)
        }
    }
    
    @IBAction func signUpButtonAction(_ sender: Any) {
        print("Signup")
    }
    
    
    // MARK: Methods
    private func configureLoginButton() {
        loginButton.layer.shadowColor = activeColor.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 4, height: 6)
        loginButton.layer.shadowOpacity = 0.5
        loginButton.layer.shadowRadius = 5
        
        loginButton.isUserInteractionEnabled = false
        loginButton.backgroundColor = .systemGray3
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
        !text.isEmpty
        else { return }// обрезаем пробелы и абзацы внутри нашего текста
        switch textField {
        case emailTextField:
            let isValidEmail = check(email: text)
            
            if isValidEmail {
                email = text
                envelopImageView.tintColor = .systemGray3
                emailLine.backgroundColor = .systemGray5
            } else {
                email = ""
                makeErrorField(textField: textField)
            }
        case passwordTextField:
            let isValidPassword = check(password: text)
            
            if isValidPassword {
                password = text
                lockImageView.tintColor = .systemGray3
                passwordLine.backgroundColor = .systemGray5
            } else {
                password = ""
                makeErrorField(textField: textField)
            }
        default:
            print("unknown")
        }
    }
    
    private func check(email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
    
    private func check(password: String) -> Bool {
        return password.count >= 4
    }

    private func makeErrorField(textField: UITextField) {
        switch textField {
        case emailTextField:
            envelopImageView.tintColor = activeColor
            emailLine.backgroundColor = activeColor
        case passwordTextField:
            lockImageView.tintColor = activeColor
            passwordLine.backgroundColor = activeColor
        default:
            print("unknown")
        }
    }
}


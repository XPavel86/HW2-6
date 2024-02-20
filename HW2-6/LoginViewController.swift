//
//  ViewController.swift
//  HW2-6
//
//  Created by Pavel Dolgopolov on 17.02.2024.
//

import UIKit

final class LoginViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet var userNameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet var remindNameButton: UIButton!
    @IBOutlet var remindPasswordButton: UIButton!
    
    //MARK: - Private Properties
    private let user = "User"
    private let password = "123"
    
    // MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    // MARK: - Overrides Methods
    //событие перед переходом на WelcomeViewController, проверяем логин
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        return checkСredentials()
    }
    
    // скрываем клавиатуру при тапе на экране
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // передаем текст в welcomeView
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeView = segue.destination as? WelcomeViewController
        
        welcomeView?.greetingText = String(
            "Welcome, \(userNameField.text ?? "")!"
        )
        //print("Go >>>")
    }
    
    // MARK: - IBAction
    // показываем подсказки логина / пароля
    @IBAction func remindUserOrPassword(sender: UIButton) {
        sender == remindNameButton ?
        showAlert(
            withTitle: "Oops!",
            andMessage: "Your name is \(user) 😉",
            clearFields: false
        ) :
        showAlert(
            withTitle: "Oops!",
            andMessage: "Your password is \(password) 😉",
            clearFields: false
        )
    }
    
    // обрабатываем закрытие welcomeView
    //
    @IBAction func unwind(for segue: UIStoryboardSegue ) {
        userNameField.text = ""
        passwordField.text = ""
        //print("Back <<<")
    }
    
    // MARK: - Public Methods
    //  событие клавиатуры при нажатии на enter
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if checkСredentials() { // переход по сегвею mainSegue
            performSegue(withIdentifier: "mainSegue", sender: self)
        }
        return true
    }
    
    // MARK: - Private Methods
    // проверяем логин / пароль
    private func checkСredentials() -> Bool {
        guard userNameField.text == user, passwordField.text == password else {
            showAlert(
                withTitle: "Invalid login or password!",
                andMessage: "Please, enter correct login and password",
                clearFields: true
            )
            return false
        }
        return true
    }
    
    // объявление алерта
    private func showAlert(
        withTitle title: String,
        andMessage message: String,
        clearFields: Bool){
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) {  _ in
                if clearFields {
                    //self.userNameField.text = ""
                    self.passwordField.text = ""
                }
            }
            alert.addAction(okAction)
            present(alert, animated: true)
        }
}

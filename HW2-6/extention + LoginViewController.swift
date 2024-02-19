//
//  extention + LoginViewController.swift
//  HW2-6
//
//  Created by Pavel Dolgopolov on 19.02.2024.
//

import UIKit

// // MARK: - IB Setup
extension LoginViewController: UITextFieldDelegate {
    
    func setupUI() {
        
        setSettings(textField: userNameField, secureText: false)
        setSettings(textField: passwordField, secureText: true)
        
        loginButton.layer.cornerRadius = 5 //скругляеем кнопку
    }
    
    private func setSettings(textField:  UITextField!, secureText: Bool) {
        
        textField.delegate = self // расширяем функционал клавиатуры
        
        textField.autocorrectionType = .no //автокоррекция отключена
        textField.smartQuotesType = .no //замена типа кавычек
        textField.smartDashesType = .no //замена тире
        textField.smartInsertDeleteType = .no //авто уд./доб. пробелов
        textField.keyboardType = .asciiCapable // отключаем смайлики
        //тип контента - ввод одноразового кода
        textField.textContentType = .oneTimeCode
        //скрытые символы при вводе
        textField.isSecureTextEntry = secureText
        //бар, который отображается над клавиатурой, nil - скрываем.
        //Может не работает, если isSecureTextEntry = false и //textContentType не равно .oneTimeCode и при не заданном keyboardType = .asciiCapable
        textField.inputAccessoryView = nil
    }
}



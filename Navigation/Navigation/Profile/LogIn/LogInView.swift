//
//  LogInView.swift
//  Navigation
//
//  Created by Владислав Ковальский on 12.05.2022.
//

import UIKit

class LogInView: UIView {

    private let defaultLogin = "default@email.com"
    private let defaultPassword = "12345678"

    weak var logBottonDelegate: ButtonLoginDelegate?

    let loginDivider: UIView = {
        let form = UIView()
        form.frame = .zero
        form.backgroundColor = ColorSet.thirdColor
        return form
    }()

    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.frame = .zero
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let mailOrPhoneNumTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "E-mail"
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addPadding(.left(10))
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addPadding(.left(10))
        textField.isSecureTextEntry = true
        return textField
    }()

    private let passWarningLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль должен содержать не менее 6-ти символов"
        label.textColor = .red
        label.isHidden = true
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

     lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = ColorSet.mainColor
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        button.addTarget(self, action: #selector(wrongLoginAlert), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var textFieldHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.layer.backgroundColor = ColorSet.secondColor.cgColor
        stack.layer.cornerRadius = 4
        stack.layer.borderColor = ColorSet.thirdColor.cgColor
        stack.layer.borderWidth = 1
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        return stack
    }()

    private lazy var logoHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.spacing = 1
        return stack
    }()

    private lazy var mainHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .equalSpacing
        return stack
    }()

    // MARK: - Методы

    override init(frame: CGRect) {
        super.init(frame: frame)
        drawSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func isValidEmail(emailID: String) -> Bool {
       let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
       let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
       return emailTest.evaluate(with: emailID)
   }

    @objc private func loginButtonPressed() {
        let password = passwordTextField.text ?? ""
        let mailOrPhoneNum = mailOrPhoneNumTextField.text ?? ""

        if mailOrPhoneNumTextField.text == "" || isValidEmail(emailID: mailOrPhoneNum) == false || mailOrPhoneNumTextField.text != defaultLogin {
            mailOrPhoneNumTextField.text = ""
            mailOrPhoneNumTextField.attributedPlaceholder = NSAttributedString(
                string: "Неверный e-mail",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
            )
        }

        if password.count <= 6 && password.count > 0 {
            passwordTextField.text = ""
            passWarningLabel.isHidden = false
        }

        if passwordTextField.text == "" || passwordTextField.text != defaultPassword {
            passwordTextField.text = ""
            passwordTextField.attributedPlaceholder = NSAttributedString(
                string: "Неверный пароль",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
            )
        }

        guard mailOrPhoneNumTextField.text != "" && passwordTextField.text != "" else { return }
        guard password.count >= 7 else { return }
        guard passwordTextField.text == defaultPassword && mailOrPhoneNumTextField.text == defaultLogin else { return }

        logBottonDelegate?.loginButtonPressed()
    }

    @objc private func wrongLoginAlert() {
        guard passwordTextField.text != defaultPassword && mailOrPhoneNumTextField.text != defaultLogin else { return }
        logBottonDelegate?.wrongLoginAlert()
    }

    private func drawSelf() {
        [logoImageView, mainHorizontalStack].forEach({ self.addSubview($0)})

        [textFieldHorizontalStack, passWarningLabel, loginButton].forEach({self.mainHorizontalStack.addArrangedSubview($0)})

        [mailOrPhoneNumTextField,loginDivider, passwordTextField].forEach({self.textFieldHorizontalStack.addArrangedSubview($0)})

        NSLayoutConstraint.activate([
            self.loginDivider.heightAnchor.constraint(equalToConstant: 1),

            self.mainHorizontalStack.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 30),
            self.mainHorizontalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.mainHorizontalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.mainHorizontalStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            self.mailOrPhoneNumTextField.heightAnchor.constraint(equalToConstant: 40),
            self.passWarningLabel.heightAnchor.constraint(equalToConstant: 14),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            self.loginButton.heightAnchor.constraint(equalToConstant: 40),

            self.logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.logoImageView.heightAnchor.constraint(equalToConstant: 75),
            self.logoImageView.widthAnchor.constraint(equalTo: self.logoImageView.heightAnchor, multiplier: 1)
        ])
    }
}

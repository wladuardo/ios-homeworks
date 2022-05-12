//
//  LogInView.swift
//  Navigation
//
//  Created by Владислав Ковальский on 12.05.2022.
//

import UIKit

class LogInView: UIView {

    private lazy var loginDivider: UIView = {
        let form = UIView()
        form.frame = .zero
        form.backgroundColor = ColorSet.thirdColor
        return form
    }()

    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.frame = .zero
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var mailOrPhoneNumTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email or phone"
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addPadding(.left(10))
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addPadding(.left(10))
        textField.isSecureTextEntry = true
        return textField
    }()

    open lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("log in", for: .normal)
        button.backgroundColor = ColorSet.mainColor
        button.layer.cornerRadius = 4
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
        stack.spacing = 10
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

    private func drawSelf() {
        [logoImageView, mainHorizontalStack].forEach({ self.addSubview($0)})

        [textFieldHorizontalStack, loginButton].forEach({self.mainHorizontalStack.addArrangedSubview($0)})

        [mailOrPhoneNumTextField,loginDivider, passwordTextField].forEach({self.textFieldHorizontalStack.addArrangedSubview($0)})

        NSLayoutConstraint.activate([
            self.loginDivider.heightAnchor.constraint(equalToConstant: 1),

            self.mainHorizontalStack.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 30),
            self.mainHorizontalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.mainHorizontalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.mainHorizontalStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            self.mailOrPhoneNumTextField.heightAnchor.constraint(equalToConstant: 40),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            self.loginButton.heightAnchor.constraint(equalToConstant: 40),

            self.logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.logoImageView.heightAnchor.constraint(equalToConstant: 75),
            self.logoImageView.widthAnchor.constraint(equalTo: self.logoImageView.heightAnchor, multiplier: 1)
        ])
    }
}

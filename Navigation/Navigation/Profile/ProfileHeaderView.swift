//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Владислав Ковальский on 20.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    private var statusText: String?

    // MARK: Свойства
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Set status", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter text here..."
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textField
    }()

    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Боб Бобов"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Wait for something..."
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "15"))
        imageView.frame = .zero
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 50
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let labelVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()

    private let infoHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 20
        return stack
    }()

    private let mainVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()

    // MARK: Методы
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func drawSelf() {
        self.addSubview(mainVerticalStack)
        [infoHorizontalStack, setStatusButton].forEach({self.mainVerticalStack.addArrangedSubview($0)})

        [avatarImageView, labelVerticalStack].forEach({self.infoHorizontalStack.addArrangedSubview($0)})

        [fullNameLabel, statusLabel, statusTextField].forEach({self.labelVerticalStack.addArrangedSubview($0)})

        NSLayoutConstraint.activate([
            self.mainVerticalStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.mainVerticalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.mainVerticalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.mainVerticalStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),

            self.avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            self.avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            self.statusTextField.heightAnchor.constraint(equalToConstant: 40),
            self.setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc private func buttonPressed() {
        statusLabel.text = statusText ?? ""
        print(statusLabel.text ?? "Поле статус пусто...")
    }

    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }
}

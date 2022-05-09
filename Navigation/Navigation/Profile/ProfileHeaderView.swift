//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Владислав Ковальский on 20.04.2022.
//

import UIKit

class ProfileHeaderView: UIView, UITextFieldDelegate {
    
    let avatarImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "15")
        view.layer.cornerRadius = 50
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Боб Бобов"
        return label
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.text = "Waiting for something..."
        return label
    }()
    
    lazy var setStatusButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowOffset.width = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(pushButton), for: .touchUpInside)
        return button
    }()

    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    @objc func pushButton(sender: UIButton) {
        print("Status is: \(String(describing: statusLabel.text))")
    }
    
    private func layout() {
        [avatarImageView, fullNameLabel, statusLabel, setStatusButton].forEach{addSubview($0)}
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 27)
        ])
        
        NSLayoutConstraint.activate([
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setStatusButton.widthAnchor.constraint(equalTo: self.window!.widthAnchor, constant: -32),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 27),
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -34)
        ])

    }
}

//
//  InfoViewController.swift
//  Navigation
//
//  Created by Владислав Ковальский on 20.04.2022.
//

import UIKit

class InfoViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupButton()
    }
    func setupView() {
        view.backgroundColor = .systemGray5
    }
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 5
        button.setTitle("АЛЕРТ!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private func setupButton() {
        self.view.addSubview(self.button)
        self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -400).isActive = true
        self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    @objc func buttonAction() {
        let alert = UIAlertController(title: "Внимание!", message: "Это алерта", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Понятно", style: UIAlertAction.Style.default) {
            UIAlertAction in
            print("Понятно")
        }
        let cancelAction = UIAlertAction(title: "Не понятно", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            print("Не понятно")
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
}

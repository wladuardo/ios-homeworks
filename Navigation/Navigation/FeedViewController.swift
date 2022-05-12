//
//  FeedViewController.swift
//  Navigation
//
//  Created by Владислав Ковальский on 20.04.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Мой пост")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        setupElements()
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .blue
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 12
        button.setTitle("Посты", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var secondButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 12
        button.setTitle("Посты", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    private func setupElements() {
        
        view.addSubview(stackView)
        [button, secondButton].forEach { stackView.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 250),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    @objc private func buttonAction() {
        let postViewController = PostViewController()
        postViewController.titlePost = post.title
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
}

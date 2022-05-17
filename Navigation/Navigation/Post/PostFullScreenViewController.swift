//
//  PostFullScreenViewController.swift
//  Navigation
//
//  Created by Владислав Ковальский on 17.05.2022.
//

import UIKit

class PostFullScreenViewController: UIViewController {

    var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.text = "nameLabel"
        return label
    }()

    var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()

    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.text = "descriptionLabel"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSelf()
        layout()
    }

    private func setupSelf() {
        self.navigationController?.isNavigationBarHidden = false
        self.view.backgroundColor = .white
        self.navigationItem.titleView?.backgroundColor = .green
    }

    private func layout() {
        self.view.backgroundColor = .white
        [authorLabel, postImageView, descriptionLabel].forEach({ view.addSubview($0) })

        let offset: CGFloat = 16

        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: offset),
            authorLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: offset),
            authorLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -offset),

            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: offset),
            postImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: offset),
            postImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -offset),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor, multiplier: 1),

            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: offset),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: offset),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -offset)
        ])
    }
}

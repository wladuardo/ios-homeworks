//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Владислав Ковальский on 09.05.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    private let whiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let postNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.numberOfLines = 2
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()

    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        return label
    }()

    private let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.backgroundColor = .white
        return label
    }()

    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.backgroundColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .white
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ model: PostModel) {
        postNameLabel.text = model.author
        postImageView.image = model.image
        descriptionLabel.text = model.description
        likesLabel.text = "Likes: " + String(model.likes)
        viewsLabel.text = "Views: " + String(model.views)
    }
  
    
    private func layout() {
        contentView.addSubview(whiteView)
        
        NSLayoutConstraint.activate([
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor),
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        [postNameLabel,postImageView, descriptionLabel, likesLabel, viewsLabel].forEach{ whiteView.addSubview($0) }
        
        let standartIndend: CGFloat = 16
        let imageIndend: CGFloat = 12
        
        NSLayoutConstraint.activate([
            postNameLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: standartIndend),
            postNameLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: standartIndend),
            postNameLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -standartIndend),
            postNameLabel.bottomAnchor.constraint(equalTo: postImageView.topAnchor, constant: -imageIndend)
        ])
        
        NSLayoutConstraint.activate([
            postImageView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor),
            postImageView.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -standartIndend),
            postImageView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor, multiplier: 1.0)

        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: standartIndend),
            descriptionLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -standartIndend)
        ])
        
        NSLayoutConstraint.activate([
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: standartIndend),
            likesLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: standartIndend),
            likesLabel.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -standartIndend),
        ])
        
        NSLayoutConstraint.activate([
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: standartIndend),
            viewsLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -standartIndend),
            viewsLabel.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -standartIndend)
        ])
    }
}

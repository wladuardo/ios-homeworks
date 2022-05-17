//
//  AllPhotoCollectionViewCell.swift
//  Navigation
//
//  Created by Владислав Ковальский on 10.05.2022.
//

import UIKit

class AllPhotoCollectionViewCell: UICollectionViewCell {

    weak var buttonAllPhotoCellDelegate: TapAllPhotoCellDelegate?

    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        setupGestures()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(photoAction))
        photoImageView.addGestureRecognizer(tapGesture)
    }

    @objc private func photoAction() {
        buttonAllPhotoCellDelegate?.tapAction(photo: photoImageView.image!)
    }

    func configure(with photo: Photo) {
        self.photoImageView.image = UIImage(named: photo.imageName)
    }

    private func layout() {
        [photoImageView].forEach({ contentView.addSubview($0)})

        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

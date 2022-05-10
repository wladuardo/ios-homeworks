//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Владислав Ковальский on 09.05.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    weak var buttonAllPhotoDelegate: ButtonAllPhotoDelegate?

        private let layoutCol: UICollectionViewFlowLayout = {
            $0.scrollDirection = .horizontal
            return $0
        }(UICollectionViewFlowLayout())

        private let allPhotoButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "next"), for: .normal)
            button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()

        private let titleLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .boldSystemFont(ofSize: 24)
            label.text = "Photos"
            return label
        }()

        lazy var collectionView: UICollectionView = {
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutCol)
            collectionView.register(PhotoPreviewCollectionViewCell.self, forCellWithReuseIdentifier: PhotoPreviewCollectionViewCell.identifier)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.dataSource = self
            collectionView.delegate = self
            return collectionView
        }()

        var photos = [Photo]()

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            layout()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func awakeFromNib() {
            super.awakeFromNib()
        }

        @objc private func tapAction() {
            buttonAllPhotoDelegate?.buttonAllPhotoPressed()
        }

        func configure(photos: [Photo]) {
            self.photos = photos
            collectionView.reloadData()
        }

        private func layout() {
            [collectionView, titleLabel, allPhotoButton].forEach({ contentView.addSubview($0) })

            let offset: CGFloat = 12

            NSLayoutConstraint.activate([

                titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: offset),
                titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: offset),
                titleLabel.trailingAnchor.constraint(equalTo: allPhotoButton.leadingAnchor),

                allPhotoButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
                allPhotoButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -offset),
                allPhotoButton.heightAnchor.constraint(equalToConstant: 25),
                allPhotoButton.widthAnchor.constraint(equalTo: allPhotoButton.heightAnchor, multiplier: 1),

                collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: offset),
                collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: offset),
                collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -offset),
                collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -offset),
            ])
        }

    }

    extension PhotosTableViewCell: UICollectionViewDataSource {

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return photos.count <= 4 ? photos.count : 4
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosPreviewCollectionViewCell.identifier, for: indexPath) as! PhotosPreviewCollectionViewCell
            cell.configure(with: photos[indexPath.row])
            cell.allPhotoButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
            return cell
        }
    }

    extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {

        private var sideInset: CGFloat { return 8 }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = (collectionView.bounds.width - sideInset * 3) / 4

            return CGSize(width: width, height: width * 0.80)
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            sideInset
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            sideInset
        }
}

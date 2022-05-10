//
//  AllPhotoViewController.swift
//  Navigation
//
//  Created by Владислав Ковальский on 10.05.2022.
//

import UIKit

class AllPhotoViewController: UIViewController {

    private let photos = Photo.allPhotos()

    private let layoutCol: UICollectionViewFlowLayout = {
        $0.scrollDirection = .vertical
        return $0
    }(UICollectionViewFlowLayout())

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutCol)
        collectionView.register(AllPhotoCollectionViewCell.self, forCellWithReuseIdentifier: AllPhotoCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
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
        self.navigationItem.title = "Photo Gallery"
    }
    
    private func layout() {
        [collectionView].forEach({ view.addSubview($0) })

        let offset: CGFloat = 8

        NSLayoutConstraint.activate([

            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: offset),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: offset),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -offset),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -offset),
        ])
    }
}


extension AllPhotoViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllPhotoCollectionViewCell.identifier, for: indexPath) as! AllPhotoCollectionViewCell
        cell.configure(with: photos[indexPath.row])
        return cell
    }
}

extension AllPhotoViewController: UICollectionViewDelegateFlowLayout {

    private var sideInset: CGFloat { return 8 }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - sideInset * 2) / 3

        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
}

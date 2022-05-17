//
//  AllPhotoViewController.swift
//  Navigation
//
//  Created by Владислав Ковальский on 10.05.2022.
//

import UIKit

class AllPhotoViewController: UIViewController {
    
    private lazy var cancelAnimationButton: UIButton = {
        let button = UIButton()
        button.layer.opacity = 0
        button.setImage(UIImage(named: "close"), for: .normal)
        button.addTarget(self, action: #selector(pressCancelAnimationButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        return button
    }()
    
    private lazy var blackView: UIView = {
        let view = UIView()
        view.frame = UIScreen.main.bounds
        view.backgroundColor = .black
        view.alpha = 0.8
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.opacity = 0
        return view
    }()
    
    private lazy var fullScreenImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "15"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.opacity = 0
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let photos = Photo.allPhotos()
    
    private lazy var layoutCol: UICollectionViewFlowLayout = {
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
        self.navigationItem.title = "Галерея"
    }
    
    private func layout() {
        [collectionView, blackView, fullScreenImageView, cancelAnimationButton].forEach({ view.addSubview($0) })
        
        let offset: CGFloat = 8
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: offset),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: offset),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -offset),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -offset),
            
            fullScreenImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fullScreenImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            fullScreenImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            fullScreenImageView.heightAnchor.constraint(equalTo: fullScreenImageView.widthAnchor, multiplier: 1),
            
            cancelAnimationButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: offset),
            cancelAnimationButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -offset),
            cancelAnimationButton.widthAnchor.constraint(equalToConstant: 40),
            cancelAnimationButton.heightAnchor.constraint(equalTo: cancelAnimationButton.widthAnchor, multiplier: 1),
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
        cell.buttonAllPhotoCellDelegate = self
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

// MARK: - TapPostImageDelegate

extension AllPhotoViewController: TapAllPhotoCellDelegate {
    
    func tapAction(photo: UIImage) {
        self.fullScreenImageView.image = photo
        self.navigationController?.isNavigationBarHidden = true
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut) {
            
            self.blackView.layer.opacity = 0.8
            self.fullScreenImageView.layer.opacity = 1
            self.view.layoutIfNeeded()
            
        } completion: { _ in
            UIView.animate(withDuration: 0.3,
                           delay: 0.0) {
                self.cancelAnimationButton.layer.opacity = 1
            }
        }
    }
    
    @objc func pressCancelAnimationButton() {
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut) {
            self.cancelAnimationButton.layer.opacity = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5,
                           delay: 0.0) {
                self.blackView.layer.opacity = 0.0
                self.fullScreenImageView.layer.opacity = 0
                self.navigationController?.isNavigationBarHidden = false
                self.view.layoutIfNeeded()
            }
        }
    }
}

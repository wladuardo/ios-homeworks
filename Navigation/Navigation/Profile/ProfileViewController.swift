//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Владислав Ковальский on 20.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileheaderView: UIView = {
        let view = ProfileHeaderView()
        view.backgroundColor = .systemGray2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var newButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("New button", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowOffset.width = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configurateHeaderView()
    }
    
    private func configurateHeaderView(){
        
        [profileheaderView, newButton].forEach{view.addSubview($0)}

        profileheaderView.frame = view.frame
     
        NSLayoutConstraint.activate([
            profileheaderView.widthAnchor.constraint(equalTo: view.widthAnchor),
            profileheaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileheaderView.heightAnchor.constraint(equalToConstant: 220)
            ])
        NSLayoutConstraint.activate([
            newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
}

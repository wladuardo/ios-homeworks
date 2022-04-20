//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Владислав Ковальский on 20.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let headerView: UIView = {
        let view = ProfileHeaderView()
        view.backgroundColor = .systemGray2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configurateHeaderView()
    }
    
    private func configurateHeaderView(){
        
        [headerView].forEach{view.addSubview($0)}

        headerView.frame = view.frame
     
        NSLayoutConstraint.activate([
            headerView.widthAnchor.constraint(equalTo: view.widthAnchor),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 220)
            ])
    }
    
    
}

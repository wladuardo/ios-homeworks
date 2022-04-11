//
//  PostViewController.swift
//  Navigation
//
//  Created by Владислав Ковальский on 10.04.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost: String = "BRATIK"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupInfoView()
    }
    private func setupView() {
        self.view.backgroundColor = .yellow
        self.navigationItem.title = titlePost
    }
    private func setupInfoView() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Добавить пост", style: .plain, target: self, action: #selector(presenter))
    }
    @objc func presenter() {
        let vc = InfoViewController()
        present(vc, animated: true)
    }
}

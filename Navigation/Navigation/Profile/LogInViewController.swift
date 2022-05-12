//
//  LogInViewController.swift
//  Navigation
//
//  Created by Владислав Ковальский on 09.05.2022.
//

import UIKit

class LogInViewController: UIViewController {

    private let nc = NotificationCenter.default

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        return $0
    }(UIView())

    private lazy var logInView: LogInView = {
        let view = LogInView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.logInView.loginButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        nc.addObserver(self, selector: #selector(kbhShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbhHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func buttonPressed() {
        let newView = ProfileViewController()
        navigationController?.pushViewController(newView, animated: true)
    }

    @objc private func kbhShow(notification: NSNotification) {
        let buttonHeight: CGFloat = 40
        if let kbhSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbhSize.height + buttonHeight
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbhSize.height + buttonHeight, right: 0)
        }
    }

    @objc private func kbhHide(notification: NSNotification) {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

    private func setupView() {
        self.view.backgroundColor = .white

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logInView)

        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),

            self.contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            self.contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            self.contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            self.logInView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            self.logInView.heightAnchor.constraint(equalToConstant: 240),
            self.logInView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.logInView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}

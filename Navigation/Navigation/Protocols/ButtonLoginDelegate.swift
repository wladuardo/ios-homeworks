//
//  ButtonLoginDelegate.swift
//  Navigation
//
//  Created by Владислав Ковальский on 23.05.2022.
//

import Foundation

protocol ButtonLoginDelegate: AnyObject {
    func loginButtonPressed()
    func wrongLoginAlert()
}

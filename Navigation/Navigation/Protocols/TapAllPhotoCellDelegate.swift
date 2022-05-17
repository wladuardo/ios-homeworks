//
//  TapAllPhotoCellDelegate.swift
//  Navigation
//
//  Created by Владислав Ковальский on 17.05.2022.
//

import UIKit

protocol TapAllPhotoCellDelegate: AnyObject {
    func tapAction(photo: UIImage)
    func pressCancelAnimationButton()
}

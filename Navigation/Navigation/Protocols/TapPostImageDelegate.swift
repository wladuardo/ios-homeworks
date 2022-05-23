//
//  TapPostImageDelegate.swift
//  Navigation
//
//  Created by Владислав Ковальский on 17.05.2022.
//

import UIKit

protocol TapPostImageDelegate: AnyObject {
    func postImagePressed(author: String, description: String, image: UIImage)
}

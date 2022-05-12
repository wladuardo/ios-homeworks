//
//  PhotosModel.swift
//  Navigation
//
//  Created by Владислав Ковальский on 10.05.2022.
//
import UIKit

struct Photo {
    var imageName: String

    static func allPhotos() -> [Photo] {
        var photos = [Photo]()
        photos.append(Photo(imageName: "p1"))
        photos.append(Photo(imageName: "p2"))
        photos.append(Photo(imageName: "p3"))
        photos.append(Photo(imageName: "p4"))
        photos.append(Photo(imageName: "p5"))
        photos.append(Photo(imageName: "p6"))
        photos.append(Photo(imageName: "p7"))
        photos.append(Photo(imageName: "p8"))
        photos.append(Photo(imageName: "p9"))
        photos.append(Photo(imageName: "p10"))
        photos.append(Photo(imageName: "p11"))
        photos.append(Photo(imageName: "p12"))
        photos.append(Photo(imageName: "p13"))
        photos.append(Photo(imageName: "p14"))
        photos.append(Photo(imageName: "p15"))
        photos.append(Photo(imageName: "p16"))
        photos.append(Photo(imageName: "p17"))
        photos.append(Photo(imageName: "p18"))
        photos.append(Photo(imageName: "p19"))
        photos.append(Photo(imageName: "p20"))
        return photos
    }
}

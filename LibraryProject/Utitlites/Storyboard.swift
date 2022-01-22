//
//  Storyboard.swift
//  LibraryProject
//
//  Created by Khaled Elshamy on 21/01/2022.
//


import UIKit

protocol Storyboarded {
    static func instantiate(storyboardName: StoryboardName) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(storyboardName: StoryboardName) -> Self {
        let id = String(describing: self)
            let storyboard = UIStoryboard(name: storyboardName.fileName, bundle: .main)
            let vc = storyboard.instantiateViewController(withIdentifier: id) as! Self
            return vc
    }
}

extension UIViewController: Storyboarded {}

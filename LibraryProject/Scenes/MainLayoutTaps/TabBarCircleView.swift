//
//  TabBarCircleView.swift
//  LibraryProject
//
//  Created by Khaled Elshamy on 21/01/2022.
//

import UIKit

class CircleView: UIView {
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.image =  #imageLiteral(resourceName: "Path 33")
        image.isUserInteractionEnabled = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .orange
        addSubviews()
    }
    
    private func addSubviews(){
        addSubview(imageView)
        imageView.anchor(centerX:centerXAnchor,centerY: centerYAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

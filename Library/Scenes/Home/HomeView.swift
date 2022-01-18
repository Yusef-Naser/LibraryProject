//
//  HomeView.swift
//  Library
//
//  Created by yusef naser on 18/01/2022.
//VC

import UIKit


class HomeView : UIView {
    
    var imageBackground : UIImageView {
        let v = UIImageView()
        v.image = UIImage(named: "nature")
        v.layer.cornerRadius = 10
        v.clipsToBounds = true 
        return v
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initViews()
    }
    
    private func initViews () {
        addViews()
    }
    
    private func addViews () {
//        addSubview(imageBackground)
//        imageBackground.anchor(top: topAnchor , leading: leadingAnchor, trailing: trailingAnchor , height: 100 )
        
        
    }
    
    
}

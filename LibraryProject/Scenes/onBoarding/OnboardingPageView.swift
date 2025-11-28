//
//  OnboardingPageView.swift
//  LibraryProject
//
//  Created by yusef naser on 27/11/2025.
//

import UIKit

class OnboardingPageView: UIView {
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let titleLabel: LLabel = {
        let label = LLabel(isBold: true , fontSize: .size_20)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    init(image : String , title : String) {
        super.init(frame: .zero)
        self.imageView.image = UIImage(named: image)!
        self.titleLabel.text = title
        initViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initViews()
    }
    
    func initViews () {
        addConstraints()
    }
    
    func addConstraints () {
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        
        imageView.anchor(top: topAnchor , leading: leadingAnchor , bottom: titleLabel.topAnchor , trailing: trailingAnchor)
        
        titleLabel.anchor(leading: leadingAnchor , trailing: trailingAnchor, centerY: centerYAnchor , paddingLeft: 16 , paddingRight: 16  , paddingCenterY: 180 )
        
    }
}

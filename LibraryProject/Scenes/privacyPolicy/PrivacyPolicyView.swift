//
//  PrivacyPolicyView.swift
//  LibraryProject
//
//  Created by yusef naser on 29/11/2025.
//

import UIKit

class PrivacyPolicyView : UIView {
    
    let navigation : NavigationBar = {
        let l = NavigationBar()
        l.labelTitle.text = SString.privacy
        return l
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.addSubview(self.contentView)
        self.contentView.anchor(top: scroll.topAnchor, leading: scroll.leadingAnchor, bottom: scroll.bottomAnchor, trailing: scroll.trailingAnchor)
        self.contentView.widthAnchor.constraint(equalTo: scroll.widthAnchor, multiplier: 1).isActive = true
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private let labelTitle : LLabel = {
        let l = LLabel(isBold: true , fontSize: .size_20)
        l.numberOfLines = 0
        return l
    }()
    
    private let labelDescription : LLabel = {
        let l = LLabel(isBold: false , fontSize: .size_16)
        l.numberOfLines = 0
        return l
    }()
    
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
        addSubview(navigation)
        addSubview(scrollView)
        contentView.addSubview(labelTitle)
        contentView.addSubview(labelDescription)
        
        
        navigation.anchor(top: topAnchor , leading: leadingAnchor , trailing: trailingAnchor)
        
        scrollView.anchor(top: navigation.bottomAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor , paddingTop: 8 , paddingLeft: 8 , paddingBottom: 8 , paddingRight: 8)
        
        labelTitle.anchor(top: contentView.topAnchor , leading: contentView.leadingAnchor , trailing: contentView.trailingAnchor , paddingTop: 16)
        
        labelDescription.anchor(top: labelTitle.bottomAnchor , leading: labelTitle.leadingAnchor , bottom: contentView.bottomAnchor , trailing: labelTitle.trailingAnchor , paddingTop: 16)
        
    }
    
    func setTitle (title : String?) {
        labelTitle.text = title
    }
    
    func setDescription (description : String?) {
        labelDescription.text = description
    }
    
    func setTitleAttributed (attributed : NSAttributedString) {
        labelTitle.attributedText = attributed
    }
    
    func setDescriptionAttributed (attributed : NSAttributedString) {
        labelDescription.attributedText = attributed
    }
}

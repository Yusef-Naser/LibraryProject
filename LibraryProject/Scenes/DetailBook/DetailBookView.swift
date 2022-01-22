//
//  DetailBookView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//VC

import UIKit


class DetailBookView : UIView {
    
    let navigation : NavigationBar = {
        let l = NavigationBar()
        l.labelTitle.text = SString.bookDetails
        return l
    }()
    
    lazy var scrollView : UIScrollView = {
        let s = UIScrollView()
        s.addSubview(parentView)
        parentView.anchor(top: s.topAnchor , leading: s.leadingAnchor , bottom: s.bottomAnchor , trailing: s.trailingAnchor )
        parentView.widthAnchor.constraint(equalTo: s.widthAnchor , multiplier: 1).isActive = true
        return s
    }()
    
    private let parentView = UIView ()
    
    private let imageBook : UIImageView = {
        let l = UIImageView()
        l.contentMode = .scaleAspectFill
        l.layer.cornerRadius = 10
        l.clipsToBounds = true
        l.image =  #imageLiteral(resourceName: "nature")
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
    
    private func initViews () {
        addViews()
    }
    
    private func addViews () {
        addSubview(navigation)
        addSubview(scrollView)
        
        parentView.addSubview(imageBook)
        
        navigation.anchor(top: topAnchor , leading: leadingAnchor , trailing: trailingAnchor )
        scrollView.anchor(top: navigation.bottomAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor )
        
        imageBook.anchor(top: parentView.topAnchor , leading: parentView.leadingAnchor , bottom: parentView.bottomAnchor , paddingTop: 16 , paddingLeft: 16 , paddingBottom: 16 , width: 110 , height: 160 )
        
    }
    
    
}

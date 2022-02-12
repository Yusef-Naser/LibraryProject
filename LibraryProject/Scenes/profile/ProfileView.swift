//
//  ProfileView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//VC

import UIKit


class ProfileView : UIView {
    
    let navigation : NavigationBar = {
        let l = NavigationBar()
        l.labelTitle.text = SString.profile
        return l
    }()
    
    lazy var scrollView : UIScrollView = {
        let s = UIScrollView()
        s.addSubview(stackParentes)
        stackParentes.anchor(top: s.topAnchor , leading: s.leadingAnchor , bottom: s.bottomAnchor , trailing: s.trailingAnchor )
        stackParentes.widthAnchor.constraint(equalTo: s.widthAnchor , multiplier: 1).isActive = true
        return s
    }()
    
    private lazy var stackParentes : UIStackView = {
        let l = UIStackView()
        l.spacing = 10
        l.axis = .vertical
        l.distribution = .fillEqually
        
        l.addArrangedSubview(textfieldName)
        l.addArrangedSubview(textfieldCardNumber)
        l.addArrangedSubview(textfieldAddress)
        l.addArrangedSubview(textfieldEmail)
        l.addArrangedSubview(buttonUpdate)
        return l
    }()
    
    private let textfieldName : UITextField = {
        let l = UITextField()
        l.borderStyle = .line
        l.layer.borderColor = Colors.grayColors.cgColor
        l.layer.borderWidth = 0.5
        l.placeholder = SString.name
        return l
    }()
    
    private let textfieldCardNumber : UITextField = {
        let l = UITextField()
        l.borderStyle = .line
        l.layer.borderColor = Colors.grayColors.cgColor
        l.layer.borderWidth = 0.5
        l.placeholder = SString.cardNumber
        return l
    }()
    
    private let textfieldAddress : UITextField = {
        let l = UITextField()
        l.borderStyle = .line
        l.layer.borderColor = Colors.grayColors.cgColor
        l.layer.borderWidth = 0.5
        l.placeholder = SString.address
        return l
    }()
    
    private let textfieldEmail : UITextField = {
        let l = UITextField()
        l.borderStyle = .line
        l.layer.borderColor = Colors.grayColors.cgColor
        l.layer.borderWidth = 0.5
        l.placeholder = SString.email
        return l
    }()
    
    
    
    let buttonUpdate : LButton = {
        let l = LButton()
        l.setTitle(SString.update , for: .normal)
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
        
        navigation.anchor(top: topAnchor , leading: leadingAnchor , trailing: trailingAnchor )
        scrollView.anchor(top: navigation.bottomAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor , paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16 )
    }
    
    
}

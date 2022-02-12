//
//  ChangePasswordView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//VC

import UIKit


class ChangePasswordView : UIView {
    
    let navigation : NavigationBar = {
        let l = NavigationBar()
        l.labelTitle.text = SString.changePassword
        return l
    }()
    
    private let textfieldPassword : UITextField = {
        let l = UITextField()
        l.borderStyle = .line
        l.layer.borderColor = Colors.grayColors.cgColor
        l.layer.borderWidth = 0.5
        l.placeholder = SString.password
        return l
    }()
    
    private let textfieldRePassword : UITextField = {
        let l = UITextField()
        l.borderStyle = .line
        l.layer.borderColor = Colors.grayColors.cgColor
        l.layer.borderWidth = 0.5
        l.placeholder = SString.password
        return l
    }()
    
    private let buttonChange : LButton = {
        let l = LButton()
        l.setTitle(SString.changePassword, for: .normal)
        return l
    }()
    
    private lazy var stackViews : UIStackView = {
        let l = UIStackView()
        l.axis = .vertical
        l.distribution = .fillEqually
        l.spacing = 10
        
        l.addArrangedSubview(textfieldPassword)
        l.addArrangedSubview(textfieldRePassword)
        
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
        addSubview(stackViews)
        addSubview(buttonChange)
    
        navigation.anchor(top: topAnchor , leading: leadingAnchor , trailing: trailingAnchor )
        stackViews.anchor(top: navigation.bottomAnchor , leading: leadingAnchor , trailing: trailingAnchor , paddingTop: 8, paddingLeft: 16 , paddingRight: 16 , height: 120 )
        buttonChange.anchor(top: stackViews.bottomAnchor , leading: leadingAnchor , trailing: trailingAnchor , paddingTop: 16, paddingLeft: 16 , paddingRight: 16 )
        
    }
    
    
}

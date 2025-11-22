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
    
    let textfieldPassword : LTextField = {
        let l = LTextField()
        l.placeholder = SString.password
        l.title = SString.newPassword
        return l
    }()
    
    let textfieldRePassword : LTextField = {
        let l = LTextField()
        l.placeholder = SString.repeatedPassword
        l.title = SString.repeatedPassword
        return l
    }()
    
    let textfieldOldPassword : LTextField = {
        let l = LTextField()
        l.placeholder = SString.oldPassword
        l.title = SString.oldPassword
        return l
    }()
    
    let buttonChange : LButton = {
        let l = LButton()
        l.setTitle(SString.changePassword, for: .normal)
        return l
    }()
    
    private lazy var stackViews : UIStackView = {
        let l = UIStackView()
        l.axis = .vertical
        l.distribution = .fillEqually
        l.spacing = 10
        
        l.addArrangedSubview(textfieldOldPassword)
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
        stackViews.anchor(top: navigation.bottomAnchor , leading: leadingAnchor , trailing: trailingAnchor , paddingTop: 16, paddingLeft: 16 , paddingRight: 16  )
        buttonChange.anchor(top: stackViews.bottomAnchor , leading: leadingAnchor , trailing: trailingAnchor , paddingTop: 16, paddingLeft: 16 , paddingRight: 16 )
        
    }
    
    
}

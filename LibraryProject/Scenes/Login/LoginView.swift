//
//  LoginView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//VC

import UIKit


class LoginView : UIView {
    
    private let imageLogo : UIImageView = {
        let l = UIImageView()
        l.layer.cornerRadius = 15
        return l
    }()
    
    private let textFieldEmail : UITextField = {
        let l = UITextField()
        
        return l
    }()
    
    private let textFieldPassword : UITextField = {
        let l = UITextField()
        l.isSecureTextEntry = true
        return l
    }()
    
    private let buttonLogin : UIButton = {
        let l = UIButton()
        l.setTitle(SString.login, for: .normal)
        l.setTitleColor(.black , for: .normal)
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
        addSubview(imageLogo)
        addSubview(textFieldEmail)
        addSubview(textFieldPassword)
        addSubview(buttonLogin)
        
        imageLogo.anchor(top: safeAreaLayoutGuide.topAnchor , centerX: centerXAnchor , paddingTop: 30 , width: 30 , height: 30 )
        
        textFieldEmail.anchor(top: imageLogo.bottomAnchor , leading: leadingAnchor , trailing: trailingAnchor , paddingTop: 16 , paddingLeft: 16 , paddingRight: 16 )
        
        
    }
    
    
}

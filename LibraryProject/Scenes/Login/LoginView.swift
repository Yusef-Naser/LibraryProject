//
//  LoginView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//VC

import UIKit


class LoginView : UIView {
    
    let navigation : NavigationBar = {
        let l = NavigationBar()
        l.labelTitle.text = SString.login
        return l
    }()
    
    private let imageLogo : UIImageView = {
        let l = UIImageView()
        l.layer.cornerRadius = 50
        l.image = #imageLiteral(resourceName: "logo")
        l.contentMode = .scaleAspectFit
        l.clipsToBounds = true
        return l
    }()
    
    let textFieldEmail : UITextField = {
        let l = UITextField()
        l.borderStyle = .roundedRect
        l.placeholder = SString.email
        return l
    }()
    
    let textFieldPassword : UITextField = {
        let l = UITextField()
        l.isSecureTextEntry = true
        l.borderStyle = .roundedRect
        l.placeholder = SString.password
        return l
    }()
    
    let buttonLogin : UIButton = {
        let l = UIButton()
        l.setTitle(SString.login, for: .normal)
        l.setTitleColor(.black , for: .normal)
        l.backgroundColor = Colors.colorPrimary
        l.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        l.layer.cornerRadius = 10
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
        
        #if DEBUG
            textFieldEmail.text = "app"
            textFieldPassword.text = "App#er!34User2"
        #endif
        
    }
    
    private func addViews () {
        addSubview(navigation)
        addSubview(imageLogo)
        addSubview(textFieldEmail)
        addSubview(textFieldPassword)
        addSubview(buttonLogin)
        
        navigation.anchor(top: topAnchor , leading: leadingAnchor , trailing: trailingAnchor )
        
        imageLogo.anchor(top: navigation.bottomAnchor , centerX: centerXAnchor , paddingTop: 30 , width: 100 , height: 50 )
        
        textFieldEmail.anchor(top: imageLogo.bottomAnchor , leading: leadingAnchor , trailing: trailingAnchor , paddingTop: 16 , paddingLeft: 16 , paddingRight: 16 , height: 50 )
        
        textFieldPassword.anchor(top: textFieldEmail.bottomAnchor , leading: leadingAnchor , trailing: trailingAnchor , paddingTop: 16, paddingLeft: 16 , paddingRight: 16 , height: 50 )
        
        buttonLogin.anchor(top: textFieldPassword.bottomAnchor , leading: leadingAnchor , trailing: trailingAnchor , paddingTop: 16, paddingLeft: 16 , paddingRight: 16 , height: 50 )
        
        
    }
    
    
}

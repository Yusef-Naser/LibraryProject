//
//  LoginView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//VC

import UIKit


class LoginView : UIView {
    
//    let navigation : NavigationBar = {
//        let l = NavigationBar()
////        l.labelTitle.text = SString.login
//        return l
//    }()
    private let heightStatusBar = UIApplication.shared.statusBarFrame.height
    
    let backButton : BackButton = {
        let l = BackButton()
        return l
    }()
    
    private let imageLogo : UIImageView = {
        let l = UIImageView()
        l.image = UIImage(named: "logo")
        l.clipsToBounds = true
        l.contentMode = .scaleAspectFit
        return l
    }()
    
    private let backgroundImage  : UIImageView = {
        let l = UIImageView()
        l.contentMode = .scaleAspectFill
        l.clipsToBounds = true
        l.image = UIImage(named: "background")
        return l
    }()
    
    private let labelTitle : LLabel = {
        let l = LLabel()
        //l.textColor = Colors.colorText
        l.text = SString.login
        return l
    }()
    
    private let labelSubTitle : LLabel = {
        let l = LLabel()
        //l.textColor = Colors.colorText
        l.text = SString.enterYourUsernameAndPassword
        return l
    }()
    
    let textFieldEmail : LTextField = {
        let l = LTextField()
        l.placeholder = SString.email
        l.title = SString.email
        return l
    }()
    
    let textFieldPassword : LTextField = {
        let l = LTextField()
        l.textField.isSecureTextEntry = true
        l.placeholder = SString.password
        l.title = SString.password
        l.enablePassword()
        return l
    }()
    
    let buttonLogin : LButton = {
        let l = LButton()
        l.setTitle(SString.login, for: .normal)
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
            textFieldEmail.textField.text = "alzad"
            textFieldPassword.textField.text = "Alzad@123"
        #endif
        
    }
    
    private func addViews () {
        
        addSubview(backgroundImage)
        addSubview(imageLogo)
        addSubview(labelTitle)
        addSubview(labelSubTitle)
        addSubview(textFieldEmail)
        addSubview(textFieldPassword)
        addSubview(buttonLogin)
        addSubview(backButton)
        
        backButton.anchor(top: topAnchor , leading: leadingAnchor , paddingTop: heightStatusBar + 8 , paddingLeft: 8 )
        
        backgroundImage.anchor(top: self.topAnchor , leading: self.leadingAnchor , bottom: self.bottomAnchor, trailing: self.trailingAnchor)
        
        imageLogo.anchor(top : self.topAnchor  , centerX: self.centerXAnchor , paddingTop: heightStatusBar + 8 , width: 220 , height: 74)
        
        labelTitle.anchor(top: self.imageLogo.bottomAnchor , leading: self.leadingAnchor , paddingTop: 16 , paddingLeft: 16)
        
        labelSubTitle.anchor(top: self.labelTitle.bottomAnchor , leading: self.leadingAnchor , trailing: self.trailingAnchor, paddingTop: 8 , paddingLeft: 16 , paddingRight: 16)
        
        textFieldEmail.anchor(top: labelSubTitle.bottomAnchor , leading: leadingAnchor , trailing: trailingAnchor , paddingTop: 16 , paddingLeft: 16 , paddingRight: 16 )
        
        textFieldPassword.anchor(top: textFieldEmail.bottomAnchor , leading: leadingAnchor , trailing: trailingAnchor , paddingTop: 16, paddingLeft: 16 , paddingRight: 16 )
        
        buttonLogin.anchor(top: textFieldPassword.bottomAnchor , leading: leadingAnchor , trailing: trailingAnchor , paddingTop: 16, paddingLeft: 16 , paddingRight: 16 , height: 50 )
        
        
    }
    
    
}

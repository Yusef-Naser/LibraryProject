//
//  LTextField.swift
//  LibraryProject
//
//  Created by yusef naser on 12/02/2022.
//

import UIKit

//class LTextField : UITextField {
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        initViews()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        initViews()
//    }
//    
//    func initViews () {
//        addConstraints()
//        self.borderStyle = .line
//        self.layer.borderColor = Colors.grayColors.cgColor
//        self.layer.borderWidth = 0.5
//
//    }
//    
//    func addConstraints () {
//        
//    }
//    
//}

class LTextField : UIView {
    
    private var securePassword = true
    
    var placeholder : String = "" {
        didSet {
            textField.placeholder = placeholder
        }
    }
    
    var title : String = "" {
        didSet {
            label.text = title
        }
    }
    
    var text: String? {
        get {
            return textField.text
        }
        set {
            textField.text = newValue
        }
    }
    
    private let imageEye : UIButton = {
        let l = UIButton()
        l.setImage(UIImage(named: "password_inactive"), for: .normal)
        l.isHidden = true
        
        return l
    }()
    
    private let label : UILabel = {
        let l = UILabel()
        l.textColor = Colors.colorGrayText
        l.font = UIFont.regular(size: .size_14)
        return l
    }()
    
    let textField : UITextField = {
        let l = UITextField()
        l.textColor = Colors.colorTextTextField
        l.font = UIFont.regular(size: .size_14)
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
        self.backgroundColor = .white
        self.layer.borderColor = Colors.colorBorder.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 10
        self.clipsToBounds = true

    }
    
    func addConstraints () {
        self.addSubview(label)
        self.addSubview(textField)
        self.addSubview(imageEye)
        
        label.anchor(top: self.topAnchor , leading: self.leadingAnchor , trailing: self.trailingAnchor , paddingTop: 8 , paddingLeft: 8 , paddingRight: 8)
        
        textField.anchor(top: label.bottomAnchor , leading: self.leadingAnchor , bottom: self.bottomAnchor, trailing: self.trailingAnchor , paddingTop: 8, paddingLeft: 8, paddingBottom: 8 , paddingRight: 8 , height: 25)
        
        imageEye.anchor(trailing: textField.trailingAnchor , centerY: textField.centerYAnchor, paddingRight: 0)
        
    }
    
    func enablePassword() {
        securePassword = true
        textField.isSecureTextEntry = true
        imageEye.isHidden = false
        imageEye.addTarget(self , action: #selector(actionPassword) , for: .touchUpInside)
    }
    
    @objc private func actionPassword () {
        if securePassword {
            securePassword = false
            imageEye.setImage(UIImage(named: "password_active"), for: .normal)
            textField.isSecureTextEntry = false
        }else {
            securePassword = true
            imageEye.setImage(UIImage(named: "password_inactive"), for: .normal)
            textField.isSecureTextEntry = true
        }
    }
    
}

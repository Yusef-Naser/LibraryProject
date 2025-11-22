//
//  ProfileView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//VC

import UIKit


class ProfileView : UIView {
    
    var completionActionDoneToolBarLibrary : ( ()->Void )?
    var completionActionDoneToolBarCategory : ( ()->Void )?
    
    var LIBRARY_TAG = 1 , CATEGORY_TAG = 2
    
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
        //l.distribution = .fillEqually
        
        l.addArrangedSubview(textfieldName)
        l.addArrangedSubview(textfieldCity)
        l.addArrangedSubview(textfieldAddress)
        l.addArrangedSubview(textfieldCategoryID)
        l.addArrangedSubview(textfieldLibraryID)
        l.addArrangedSubview(buttonUpdate)
        return l
    }()
    
    let textfieldName : LTextField = {
        let l = LTextField()
        l.placeholder = SString.name
        l.title = SString.name
        return l
    }()
    
    let textfieldCity : LTextField = {
        let l = LTextField()
        l.placeholder = SString.city
        l.title = SString.city
        return l
    }()
    
    let textfieldAddress : LTextField = {
        let l = LTextField()
        l.placeholder = SString.address
        l.title = SString.address
        return l
    }()
    
    lazy var textfieldCategoryID : LTextField = {
        let l = LTextField()
        l.placeholder = SString.categoryID
        l.title = SString.categoryID
        
        l.textField.inputView = pickerViewCategory
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width , height: 50 ))
        toolbar.barStyle = .default
        toolbar.items = [UIBarButtonItem(title: "Done" , style: .done , target: self , action: #selector(actionDoneToolBarCategory))]
        toolbar.sizeToFit()
        
        l.textField.inputAccessoryView = toolbar
        
        return l
    }()
    
    lazy var textfieldLibraryID : LTextField = {
        let l = LTextField()
        l.placeholder = SString.libraryID
        l.title = SString.libraryID
        
        l.textField.inputView = pickerViewLibrary
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width , height: 50 ))
        toolbar.barStyle = .default
        toolbar.items = [UIBarButtonItem(title: "Done" , style: .done , target: self , action: #selector(actionDoneToolBarLibrary))]
        toolbar.sizeToFit()
        
        l.textField.inputAccessoryView = toolbar
        
        return l
    }()
    
    lazy var pickerViewLibrary : UIPickerView = {
        let l = UIPickerView()
        l.tag = LIBRARY_TAG
        return l
    }()
    lazy var pickerViewCategory : UIPickerView = {
        let l = UIPickerView()
        l.tag = CATEGORY_TAG
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
    
    @objc private func actionDoneToolBarLibrary () {
        completionActionDoneToolBarLibrary?()
    }
    
    @objc private func actionDoneToolBarCategory () {
        completionActionDoneToolBarCategory?()
    }
    
}

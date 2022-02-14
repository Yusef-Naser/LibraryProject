//
//  AddSuggestView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 12/02/2022.
//VC

import UIKit

class AddSuggestView : UIView {
    
    let navigation : NavigationBar = {
        let l = NavigationBar()
        l.labelTitle.text = SString.addSuggest
        return l
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.addSubview(self.stackViews)
        self.stackViews.anchor(top: scroll.topAnchor, leading: scroll.leadingAnchor, bottom: scroll.bottomAnchor, trailing: scroll.trailingAnchor)
        self.stackViews.widthAnchor.constraint(equalTo: scroll.widthAnchor, multiplier: 1).isActive = true
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
       
    
    private let textFieldTitle : LTextField = {
        let l = LTextField()
        l.placeholder = SString.title
        return l
    }()
    
    private let textFieldAuthor : LTextField = {
        let l = LTextField()
        l.placeholder = SString.author
        return l
    }()
    
    private let textFieldCopyRightDate : LTextField = {
        let l = LTextField()
        l.placeholder = SString.copyrightDate
        return l
    }()
    
    private let textFieldPublisher : LTextField = {
        let l = LTextField()
        l.placeholder = SString.publisher
        return l
    }()
    
    private let textFieldCollectionTitle : LTextField = {
        let l = LTextField()
        l.placeholder = SString.collectionTitle
        return l
    }()
    
    private let textFieldPublicationPlace : LTextField = {
        let l = LTextField()
        l.placeholder = SString.publicationPlace
        return l
    }()
    
    private let textFieldQuantity : LTextField = {
        let l = LTextField()
        l.placeholder = SString.quantity
        return l
    }()
    
    private let textFieldItemType : LTextField = {
        let l = LTextField()
        l.placeholder = SString.itemType
        return l
    }()
    
    private let textFieldLibrary : LTextField = {
        let l = LTextField()
        l.placeholder = SString.library
        return l
    }()
    
    private let textFieldNotes : LTextField = {
        let l = LTextField()
        l.placeholder = SString.notes
        return l
    }()
    
    private lazy var stackViews : UIStackView = {
        let l = UIStackView()
        l.spacing = 10
        l.distribution = .fillEqually
        l.axis = .vertical
        
        l.addArrangedSubview(textFieldTitle)
        l.addArrangedSubview(textFieldAuthor)
        l.addArrangedSubview(textFieldCopyRightDate)
        l.addArrangedSubview(textFieldPublisher)
        l.addArrangedSubview(textFieldCollectionTitle)
        l.addArrangedSubview(textFieldPublicationPlace)
        l.addArrangedSubview(textFieldQuantity)
        l.addArrangedSubview(textFieldItemType)
        l.addArrangedSubview(textFieldLibrary)
        l.addArrangedSubview(textFieldNotes)
        
        textFieldTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        return l
    }()
    
    private let buttonSubmit : LButton = {
        let l = LButton()
        l.setTitle(SString.submit, for: .normal)
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
        addSubview(buttonSubmit)
        
        navigation.anchor(top: self.topAnchor , leading: self.leadingAnchor , trailing: self.trailingAnchor )
        
        scrollView.anchor(top: navigation.bottomAnchor , leading: leadingAnchor , trailing: trailingAnchor , paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8 )
        
        buttonSubmit.anchor(top: scrollView.bottomAnchor, leading: leadingAnchor , bottom: safeAreaLayoutGuide.bottomAnchor , trailing: trailingAnchor , paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8  )
        
    }
    
    
}

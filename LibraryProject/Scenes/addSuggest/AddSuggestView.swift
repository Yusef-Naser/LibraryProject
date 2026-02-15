//
//  AddSuggestView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 12/02/2022.
//VC

import UIKit

class AddSuggestView : UIView {
    
    var completionActionDoneLibrary : ( ()->Void )?
    var completionActionCopyRightDate : ( ()->Void )?
    
    let navigation : NavigationBar = {
        let l = NavigationBar()
        l.labelTitle.text = SString.addSuggest
        return l
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.addSubview(self.parentView)
        self.parentView.anchor(top: scroll.topAnchor, leading: scroll.leadingAnchor, bottom: scroll.bottomAnchor, trailing: scroll.trailingAnchor)
        self.parentView.widthAnchor.constraint(equalTo: scroll.widthAnchor, multiplier: 1).isActive = true
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    private let parentView : UIView = {
        let l = UIView()
        return l
    }()
    
    private let imageView : UIImageView = {
        let l = UIImageView()
        l.image = UIImage(named: "suggestBook")
        l.contentMode = .scaleAspectFill
        return l
    }()
    
    
    
    let textFieldTitle : LTextField = {
        let l = LTextField()
        l.title = SString.titleBook
        l.placeholder = SString.type + " " + SString.titleBook
        return l
    }()
    
    let textFieldAuthor : LTextField = {
        let l = LTextField()
        l.title = SString.author
        l.placeholder = SString.type + " " + SString.author
        return l
    }()
    
    lazy var textFieldCopyRightDate : LTextField = {
        let l = LTextField()
        l.placeholder = SString.copyrightDate
        l.textField.inputView = pickerDate
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width , height: 50 ))
        toolbar.barStyle = .default
        toolbar.items = [UIBarButtonItem(title: "Done" , style: .done , target: self , action: #selector(actionDoneCopyRightDate))]
        toolbar.sizeToFit()
        
        l.textField.inputAccessoryView = toolbar
        return l
    }()
    
    let pickerDate : UIDatePicker = {
        let l = UIDatePicker()
        l.datePickerMode = .date
        if #available(iOS 13.4, *) {
            l.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        return l
    }()
    
    let textFieldPublisher : LTextField = {
        let l = LTextField()
        l.placeholder = SString.publisher
        return l
    }()
    
    let textFieldCollectionTitle : LTextField = {
        let l = LTextField()
        l.placeholder = SString.collectionTitle
        return l
    }()
    
    let textFieldPublicationPlace : LTextField = {
        let l = LTextField()
        l.placeholder = SString.publicationPlace
        return l
    }()
    
    let textFieldQuantity : LTextField = {
        let l = LTextField()
        l.placeholder = SString.quantity
        return l
    }()
    
    let textFieldItemType : LTextField = {
        let l = LTextField()
        l.placeholder = SString.itemType
        return l
    }()
    
    lazy var textFieldLibrary : LTextField = {
        let l = LTextField()
        l.placeholder = SString.library
        l.title = SString.select + " " + SString.library
        l.textField.inputView = pickerViewTopics
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width , height: 50 ))
        toolbar.barStyle = .default
        toolbar.items = [UIBarButtonItem(title: "Done" , style: .done , target: self , action: #selector(actionDoneLibrary))]
        toolbar.sizeToFit()
        
        l.textField.inputAccessoryView = toolbar
        
        return l
    }()
    
    let pickerViewTopics = UIPickerView()
    
    let textFieldNotes : LTextField = {
        let l = LTextField()
        l.placeholder = SString.notes
        return l
    }()
    
//    private lazy var stackViews : UIStackView = {
//        let l = UIStackView()
//        l.spacing = 10
////        l.distribution = .fillEqually
//        l.axis = .vertical
//        
//        l.addArrangedSubview(textFieldTitle)
//        l.addArrangedSubview(textFieldAuthor)
//      //  l.addArrangedSubview(textFieldCopyRightDate)
//      //  l.addArrangedSubview(textFieldPublisher)
//       // l.addArrangedSubview(textFieldCollectionTitle)
//      //  l.addArrangedSubview(textFieldPublicationPlace)
//      //  l.addArrangedSubview(textFieldQuantity)
//      //  l.addArrangedSubview(textFieldItemType)
//        l.addArrangedSubview(textFieldLibrary)
//    //   l.addArrangedSubview(textFieldNotes)
//        
//        
//        return l
//    }()
    
    let buttonSubmit : LButton = {
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
        
        parentView.addSubview(imageView)
        parentView.addSubview(textFieldTitle)
        parentView.addSubview(textFieldAuthor)
        parentView.addSubview(textFieldLibrary)
        
        addSubview(buttonSubmit)
        
        navigation.anchor(top: self.topAnchor , leading: self.leadingAnchor , trailing: self.trailingAnchor )
        
        scrollView.anchor(top: navigation.bottomAnchor , leading: leadingAnchor , trailing: trailingAnchor , paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8 )
        
        imageView.anchor(top: parentView.topAnchor , leading: parentView.leadingAnchor , trailing: parentView.trailingAnchor , paddingTop: 16 , paddingLeft: 16 , paddingRight: 16)
        
        textFieldTitle.anchor(top: imageView.bottomAnchor , leading: parentView.leadingAnchor , trailing: parentView.trailingAnchor , paddingTop: 16 , paddingLeft: 16 , paddingRight: 16)
        
        textFieldAuthor.anchor(top: textFieldTitle.bottomAnchor , leading: parentView.leadingAnchor , trailing: parentView.trailingAnchor , paddingTop: 16 , paddingLeft: 16 , paddingRight: 16)
        
        textFieldLibrary.anchor(top: textFieldAuthor.bottomAnchor , leading: parentView.leadingAnchor , bottom: parentView.bottomAnchor , trailing: parentView.trailingAnchor , paddingTop: 16 , paddingLeft: 16 , paddingBottom: 16, paddingRight: 16)
        
        buttonSubmit.anchor(top: scrollView.bottomAnchor, leading: leadingAnchor , bottom: safeAreaLayoutGuide.bottomAnchor , trailing: trailingAnchor , paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8  )
        
    }
    
    @objc private func actionDoneLibrary () {
        completionActionDoneLibrary?()
    }
    
    @objc private func actionDoneCopyRightDate () {
        completionActionCopyRightDate?()
    }
    
}

//
//  DetailBookView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//VC

import UIKit

protocol DetailBookViewConfiguration {
    func setTitle (title : String?)
    func setPersonalName (name : String?)
    func setPublicationDetails (details : String?)
    func setSubjects (subjects : String?)
    func subjectsView (abstract : String?)
    func setAbstract (abstract : String?)
    func DDCClassification (classification : String?)
    func getDescription (des : String?)
    
}

class DetailBookView : UIView {
    
    let navigation : NavigationBar = {
        let l = NavigationBar()
        l.labelTitle.text = SString.bookDetails
        return l
    }()
    
    lazy var scrollView : UIScrollView = {
        let s = UIScrollView()
        s.addSubview(parentView)
        parentView.anchor(top: s.topAnchor , leading: s.leadingAnchor , bottom: s.bottomAnchor , trailing: s.trailingAnchor )
        parentView.widthAnchor.constraint(equalTo: s.widthAnchor , multiplier: 1).isActive = true
        return s
    }()
    
    private let parentView = UIView ()
    
    let imageBook : UIImageView = {
        let l = UIImageView()
        l.contentMode = .scaleAspectFill
        l.layer.cornerRadius = 10
        l.clipsToBounds = true
       
        return l
    }()
    
    private let labelTitle : UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        return l
    }()
    
    private let labelPersonalName : UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        return l
    }()
    
    private let publicationDetails : ViewBookDetail = {
        let l = ViewBookDetail(title: SString.publicationDetails)
        return l
    }()
    
    private let subjectsView : ViewBookDetail = {
        let l = ViewBookDetail(title: SString.subjects)
        return l
    }()
    private let abstractView : ViewBookDetail = {
        let l = ViewBookDetail(title: SString.abstract)
        return l
    }()
    private let DDCClassificationView : ViewBookDetail = {
        let l = ViewBookDetail(title: SString.DDCClassification)
        return l
    }()
    
    private let getDesciptionView : ViewBookDetail = {
        let l = ViewBookDetail(title: SString.description )
        return l
    }()
    
    private lazy var stackView : UIStackView = {
        let l = UIStackView()
        l.spacing = 10
        l.axis = .vertical
        
        l.addArrangedSubview(publicationDetails)
        l.addArrangedSubview(abstractView)
        l.addArrangedSubview(subjectsView)
        l.addArrangedSubview(DDCClassificationView)
        l.addArrangedSubview(getDesciptionView)
        
        return l
    }()
    
    
    private let labelItem  : UILabel = {
        let l = UILabel()
        l.text = SString.items
        return l
    }()
    let fitTableView : FitTableView = {
        let l = FitTableView()
        l.register(CellItemBook.self , forCellReuseIdentifier: CellItemBook.getIdentifier())
        return l
    }()
    
    let buttonAddHold : LButton = {
        let l = LButton()
        l.setTitle(SString.addHold , for: .normal)
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
        addSubview(buttonAddHold)
        
        parentView.addSubview(imageBook)
        parentView.addSubview(labelTitle)
        parentView.addSubview(labelPersonalName)
        parentView.addSubview(stackView)
        parentView.addSubview(labelItem)
        parentView.addSubview(fitTableView)
        
        
        navigation.anchor(top: topAnchor , leading: leadingAnchor , trailing: trailingAnchor )
        scrollView.anchor(top: navigation.bottomAnchor , leading: leadingAnchor , bottom: buttonAddHold.topAnchor , trailing: trailingAnchor )
        
        buttonAddHold.anchor( leading: leadingAnchor , bottom: safeAreaLayoutGuide.bottomAnchor , trailing: trailingAnchor , paddingLeft: 8, paddingBottom: 8, paddingRight: 8 )
        
        imageBook.anchor(top: parentView.topAnchor , leading: parentView.leadingAnchor  , paddingTop: 16 , paddingLeft: 16 , paddingBottom: 16 , width: 110 , height: 160 )
        
        labelTitle.anchor(top: imageBook.topAnchor , leading: imageBook.trailingAnchor , trailing: parentView.trailingAnchor , paddingTop: 8, paddingLeft: 8 , paddingRight: 8 )
        
        labelPersonalName.anchor(top: labelTitle.bottomAnchor , leading: imageBook.trailingAnchor , trailing: parentView.trailingAnchor , paddingTop: 8, paddingLeft: 8, paddingRight: 8 )
        
        stackView.anchor(top: imageBook.bottomAnchor , leading: parentView.leadingAnchor  , trailing: parentView.trailingAnchor , paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16  )
        
        labelItem.anchor(top: stackView.bottomAnchor , leading: parentView.leadingAnchor , paddingTop: 16, paddingLeft: 16 )
        
        fitTableView.anchor(top: labelItem.bottomAnchor , leading: parentView.leadingAnchor , bottom: parentView.bottomAnchor , trailing: parentView.trailingAnchor , paddingTop: 16, paddingLeft: 16, paddingBottom: 16 , paddingRight: 16 )
        
    }
    
    
    
    
}

extension DetailBookView : DetailBookViewConfiguration {
    func subjectsView(abstract: String?) {

    }
    
    func setTitle (title : String?) {
        labelTitle.text = title
    }
    
    func setPersonalName (name : String?) {
        labelPersonalName.text = "by: \(name ?? "" )"
    }
    
    func setPublicationDetails(details: String?) {
        publicationDetails.setDetails(details: details)
    }
    func setSubjects(subjects: String?) {
        subjectsView.setDetails(details: subjects)
    }
    
    func setAbstract (abstract : String?) {
        abstractView.setDetails(details: abstract)

    }

    func DDCClassification(classification: String?) {
        DDCClassificationView.setDetails(details: classification)
    }
    
    func getDescription(des: String?) {
        getDesciptionView.setDetails(details: des)
    }
    
}

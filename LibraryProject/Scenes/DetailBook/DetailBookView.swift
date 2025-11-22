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

@objc protocol DetailBookViewDelegate : AnyObject {
    func dismiss()
    func favorite()
}

class DetailBookView : UIView {
    
    weak var delegate : DetailBookViewDelegate?
    
    let topSafeArea = UIApplication.shared.keyWindow?.safeAreaInsets.top
    
    private let backgroundView : UIView = {
        let l = UIView()
        l.backgroundColor = Colors.colorbackgroundDetails
        return l
    }()
    
    lazy var backButton : BackButton = {
        let l = BackButton()
        return l
    }()
    
    lazy var buttonFavorite : UIButton = {
        let l = UIButton()
        l.setImage(#imageLiteral(resourceName: "unfavorite"), for: .normal )
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
    
    let imageBookBackground : UIImageView = {
        let l = UIImageView()
        l.contentMode = .scaleAspectFill
        l.clipsToBounds = true
       
        let view = UIView()
        view.backgroundColor = Colors.colorbackgroundDetailsAlph
        
        
        let gradient = UIImageView(image: UIImage(named: "image_gradient"))
        gradient.contentMode = .scaleAspectFill
        gradient.clipsToBounds = true
        
        l.addSubview(view)
        l.addSubview(gradient)
        
        view.anchor(top: l.topAnchor , leading: l.leadingAnchor , bottom: l.bottomAnchor , trailing: l.trailingAnchor)
        gradient.anchor(top: l.topAnchor , leading: l.leadingAnchor , bottom: l.bottomAnchor , trailing: l.trailingAnchor)
        return l
    }()
    
    private let labelTitle : LLabel = {
        let l = LLabel(isBold: true , fontSize: .size_18)
        l.numberOfLines = 0
        l.adjustsFontForContentSizeCategory = true
        return l
    }()
    
    private let labelPersonalName : LLabel = {
        let l = LLabel(isBold: false , fontSize: .size_14)
        l.numberOfLines = 0
        l.textColor = Colors.colorPrimary
        l.adjustsFontForContentSizeCategory = true
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
        
        l.addArrangedSubview(abstractView)
        l.addArrangedSubview(getDesciptionView)
        l.addArrangedSubview(publicationDetails)
        l.addArrangedSubview(subjectsView)
        l.addArrangedSubview(DDCClassificationView)
        
        return l
    }()
    
    
    private lazy var expandableView : ExpandableView = {
        let l = ExpandableView(title: SString.aboutTheBook, contentView: stackView)
        return l
    }()

    let fitTableView : FitTableView = {
        let l = FitTableView()
        l.register(CellItemBook.self , forCellReuseIdentifier: CellItemBook.getIdentifier())
        return l
    }()
    
    private lazy var expandableViewItems : ExpandableView = {
        let l = ExpandableView(title: SString.items, contentView: fitTableView)
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
        backButton.addTarget(delegate , action: #selector(DetailBookViewDelegate.dismiss), for: .touchUpInside)
        buttonFavorite.addTarget(delegate , action: #selector(DetailBookViewDelegate.favorite), for: .touchUpInside)
    }
    
    private func addViews () {
        addSubview(backgroundView)
        
        addSubview(scrollView)
        addSubview(backButton)
        addSubview(buttonFavorite)
        addSubview(buttonAddHold)
        
        parentView.addSubview(imageBookBackground)
        parentView.addSubview(imageBook)
        parentView.addSubview(labelTitle)
        parentView.addSubview(labelPersonalName)
        parentView.addSubview(expandableView)
        parentView.addSubview(expandableViewItems)
       // parentView.addSubview(fitTableView)
        
        backgroundView.anchor(top: topAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor)
        
        
        backButton.anchor(top: topAnchor , leading: leadingAnchor , paddingTop: (topSafeArea ?? 0) + 8 , paddingLeft: 16 )
        
        buttonFavorite.anchor(top: topAnchor , trailing: trailingAnchor , paddingTop: (topSafeArea ?? 0) + 8 , paddingRight: 16 )
        
        scrollView.anchor(top: self.topAnchor , leading: leadingAnchor , bottom: buttonAddHold.topAnchor , trailing: trailingAnchor  )
        
        buttonAddHold.anchor( leading: leadingAnchor , bottom: safeAreaLayoutGuide.bottomAnchor , trailing: trailingAnchor , paddingLeft: 8, paddingBottom: 8, paddingRight: 8 )
        
        imageBook.anchor(top: parentView.topAnchor , centerX: parentView.centerXAnchor , paddingTop: 16  , width: 150 , height: 250 )
        
        imageBookBackground.anchor(top: parentView.topAnchor , leading: parentView.leadingAnchor , trailing: parentView.trailingAnchor , paddingTop: -( ( topSafeArea ?? 0 ) + 32) , height: 500 )
        
        labelTitle.anchor(top: imageBook.bottomAnchor , leading: parentView.leadingAnchor , trailing: parentView.trailingAnchor , paddingTop: 16, paddingLeft: 16 , paddingRight: 16 )
        
        labelPersonalName.anchor(top: labelTitle.bottomAnchor , leading: parentView.leadingAnchor , trailing: parentView.trailingAnchor , paddingTop: 8, paddingLeft: 16, paddingRight: 16 )
        
        expandableView.anchor(top: labelPersonalName.bottomAnchor , leading: parentView.leadingAnchor  , trailing: parentView.trailingAnchor , paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16  )
        
        expandableViewItems.anchor(top: expandableView.bottomAnchor , leading: parentView.leadingAnchor , bottom: parentView.bottomAnchor , trailing: parentView.trailingAnchor , paddingTop: 16, paddingLeft: 16 , paddingBottom: 16 , paddingRight: 16 )
        
//        fitTableView.anchor(top: labelItem.bottomAnchor , leading: parentView.leadingAnchor , bottom: parentView.bottomAnchor , trailing: parentView.trailingAnchor , paddingTop: 16, paddingLeft: 16, paddingBottom: 16 , paddingRight: 16 )
        
    }
    
    
    
    
}

extension DetailBookView : DetailBookViewConfiguration {
    func subjectsView(abstract: String?) {

    }
    
    func setTitle (title : String?) {
        labelTitle.text = title
    }
    
    func setPersonalName (name : String?) {
        labelPersonalName.text = "\(SString.by): \(name ?? "" )"
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

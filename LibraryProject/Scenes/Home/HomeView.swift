//
//  HomeView.swift
//  Library
//
//  Created by yusef naser on 18/01/2022.
//VC

import UIKit


class HomeView : UIView {
    
    let listSlider : [UIImage] = [
        #imageLiteral(resourceName: "slider1") ,
            #imageLiteral(resourceName: "slider2") ,
            #imageLiteral(resourceName: "slider3") ,
            #imageLiteral(resourceName: "slider4") ,
            #imageLiteral(resourceName: "slider5") ,
            #imageLiteral(resourceName: "slider6") ,
            #imageLiteral(resourceName: "slider7") ,
    ]
    
    var imageBackground : UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "background")
        v.contentMode = .scaleAspectFill
        v.layer.cornerRadius = 10
        v.clipsToBounds = true 
        return v
    }()
    
    private let labelTitle : LLabel = {
        let l = LLabel(isBold: true , fontSize: .size_20)
        l.text = SString.goodMorning
        return l
    }()
    
    private let labelSubTitle : LLabel = {
        let l = LLabel(isBold: false , fontSize: .size_14)
        l.text = SString.welcomeTawazun
        return l
    }()
    
    
    private let filterView : FilterView = {
        let l = FilterView()
        
        return l
    }()
    
    let searchView : SearchItemView = {
        let l = SearchItemView()
        l.disableSearchText()
        return l
    }()
    
    private lazy var stackViewSearch : UIStackView = {
        let l = UIStackView()
        l.axis = .horizontal
        l.spacing = 10
        
        l.addArrangedSubview(searchView)
     //   l.addArrangedSubview(filterView)
        
    //    filterView.widthAnchor.constraint(equalTo: searchView.widthAnchor , multiplier: 0.5).isActive = true
        
        return l
    }()
    
    lazy var scrollView : UIScrollView = {
        let s = UIScrollView()
        s.addSubview(parentView)
        parentView.anchor(top: s.topAnchor , leading: s.leadingAnchor , bottom: s.bottomAnchor , trailing: s.trailingAnchor )
        parentView.widthAnchor.constraint(equalTo: s.widthAnchor , multiplier: 1).isActive = true
        return s
    }()
    
    lazy private var parentView : UIView = {
        let l = UIView ()
        l.backgroundColor = UIColor.clear
        return l
    }()
    
    
    let sectionNewBooks : SectionBooksView = {
        let l = SectionBooksView(title: SString.newBooks)
        return l
    }()
    
    private let labelFeaturedBooks : LLabel = {
        let l = LLabel(isBold: true , fontSize: .size_20)
        l.text = SString.featureBooks
        return l
    }()
    
    let buttonViewAll : UIButton = {
        let l = UIButton()
        l.setTitle(SString.viewAll, for: .normal)
        l.setTitleColor(Colors.colorPrimary, for: .normal)
        return l
    }()
    
    private lazy var viewLabelFeaturedBooks : UIView = {
        let l = UIView()
        
        l.addSubview(labelFeaturedBooks)
        l.addSubview(buttonViewAll)
        
        labelFeaturedBooks.anchor(top: l.topAnchor , leading: l.leadingAnchor , bottom: l.bottomAnchor)
        buttonViewAll.anchor(top: l.topAnchor , bottom: l.bottomAnchor , trailing: l.trailingAnchor )
        
        return l
    }()
    
    let tableFeaturedBooks : FitTableView = {
        let l = FitTableView()
        l.tableFooterView = UIView()
        l.register(FavoriteCell.self , forCellReuseIdentifier: FavoriteCell.getIdentifier() )
        l.separatorStyle = .none
        return l
    }()
    
    let sectionSeggestedBooks : SectionBooksView = {
        let l = SectionBooksView(title: SString.suggestedBooks)
        return l
    }()
    
    private lazy var stackSectionBooks : UIStackView = {
        let l = UIStackView()
        l.spacing = 10
        l.axis = .vertical
       // l.distribution = .fillEqually
        
        l.addArrangedSubview(sectionNewBooks)
        l.addArrangedSubview(viewLabelFeaturedBooks)
        l.addArrangedSubview(tableFeaturedBooks)
        l.addArrangedSubview(sectionSeggestedBooks)
        
        return l
    }()
    
    private let imageViewFooter : UIImageView = {
        let l = UIImageView()
        l.image = #imageLiteral(resourceName: "flower")
        l.contentMode = .scaleAspectFill
        l.layer.cornerRadius = 10
        l.clipsToBounds = true
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
        addSubview(imageBackground)
        addSubview(labelTitle)
        addSubview(labelSubTitle)
        
        addSubview(stackViewSearch)
        addSubview(scrollView)
        
        parentView.addSubview(stackSectionBooks)
        parentView.addSubview(imageViewFooter)
        
        imageBackground.anchor(top: topAnchor , leading: leadingAnchor, bottom: self.bottomAnchor, trailing: trailingAnchor )
        
        labelTitle.anchor(top: self.safeAreaLayoutGuide.topAnchor , leading: self.leadingAnchor , trailing: self.trailingAnchor , paddingTop: 8 , paddingLeft: 16 , paddingRight: 16)
        
        labelSubTitle.anchor(top: labelTitle.bottomAnchor , leading: self.leadingAnchor , trailing: self.trailingAnchor , paddingTop: 16 , paddingLeft: 16 , paddingRight: 16 )
        
        stackViewSearch.anchor(top: labelSubTitle.bottomAnchor , leading: leadingAnchor , trailing: trailingAnchor , paddingTop: 20 , paddingLeft: 16 , paddingRight: 16 )
        
        scrollView.anchor(top: stackViewSearch.bottomAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor )
                
        stackSectionBooks.anchor(top: parentView.topAnchor , leading: parentView.leadingAnchor , trailing: parentView.trailingAnchor , paddingTop: 16 , paddingLeft: 16 , paddingRight: 16 )
        
        imageViewFooter.anchor(top: stackSectionBooks.bottomAnchor , leading: parentView.leadingAnchor , bottom: parentView.bottomAnchor , trailing: parentView.trailingAnchor , paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16 , height: 100 )
        
    }
    
    func setDelegates (delegate : HomeVC?) {
        sectionSeggestedBooks.delegateView = delegate
        sectionNewBooks.delegateView = delegate
        tableFeaturedBooks.delegate = delegate
        tableFeaturedBooks.dataSource = delegate
    }
    
}

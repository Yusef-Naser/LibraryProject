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
    
    let collectioViewSlider : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        let l = UICollectionView(frame: .zero , collectionViewLayout: layout)
        l.showsHorizontalScrollIndicator = false
        l.backgroundColor = .clear
        l.register( CellSlider.self , forCellWithReuseIdentifier: CellSlider.getIdentifier())
        
        return l
    }()
    
    let sectionNewBooks : SectionBooksView = {
        let l = SectionBooksView(title: SString.newBooks)
        return l
    }()
    
    let sectionFeatureBooks : SectionBooksView = {
        let l = SectionBooksView(title: SString.featureBooks)
        return l
    }()
    
    private lazy var stackSectionBooks : UIStackView = {
        let l = UIStackView()
        l.spacing = 10
        l.axis = .vertical
        l.distribution = .fillEqually
        
        l.addArrangedSubview(sectionNewBooks)
        l.addArrangedSubview(sectionFeatureBooks)
        
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
        
        parentView.addSubview(collectioViewSlider)
        parentView.addSubview(stackSectionBooks)
        parentView.addSubview(imageViewFooter)
        
        imageBackground.anchor(top: topAnchor , leading: leadingAnchor, bottom: self.bottomAnchor, trailing: trailingAnchor )
        
        labelTitle.anchor(top: self.safeAreaLayoutGuide.topAnchor , leading: self.leadingAnchor , trailing: self.trailingAnchor , paddingTop: 8 , paddingLeft: 16 , paddingRight: 16)
        
        labelSubTitle.anchor(top: labelTitle.bottomAnchor , leading: self.leadingAnchor , trailing: self.trailingAnchor , paddingTop: 16 , paddingLeft: 16 , paddingRight: 16 )
        
        stackViewSearch.anchor(top: labelSubTitle.bottomAnchor , leading: leadingAnchor , trailing: trailingAnchor , paddingTop: 20 , paddingLeft: 16 , paddingRight: 16 )
        
        scrollView.anchor(top: stackViewSearch.bottomAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor )
        
        collectioViewSlider.anchor(top: parentView.topAnchor , leading: parentView.leadingAnchor , trailing: parentView.trailingAnchor , paddingTop: 16 , paddingLeft: 0, paddingBottom: 0, paddingRight: 0 , height: (UIScreen.main.bounds.width / 2) + 30 )
        
        stackSectionBooks.anchor(top: collectioViewSlider.bottomAnchor , leading: parentView.leadingAnchor , trailing: parentView.trailingAnchor , paddingTop: 16  )
        
        imageViewFooter.anchor(top: stackSectionBooks.bottomAnchor , leading: parentView.leadingAnchor , bottom: parentView.bottomAnchor , trailing: parentView.trailingAnchor , paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16 , height: 100 )
        
    }
    
    func setDelegates (delegate : HomeVC?) {
        collectioViewSlider.delegate = delegate
        collectioViewSlider.dataSource = delegate
        sectionFeatureBooks.delegateView = delegate
        sectionNewBooks.delegateView = delegate
    }
    
}

//
//  SearchView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 22/01/2022.
//VC

import UIKit

class SearchView : UIView {
    
    private let navigation : NavigationBar = {
        let l = NavigationBar()
        l.labelTitle.text = SString.search
        return l
    }()
    
    lazy var searchItem : SearchItemView = {
        let l = SearchItemView()
        return l
    }()
    
    let filterView : FilterView = {
        let l = FilterView()
        l.isUserInteractionEnabled = true
        return l
    }()
    
    private lazy var stackViewSearch : UIStackView = {
        let l = UIStackView()
        l.axis = .horizontal
        l.spacing = 10
        
        l.addArrangedSubview(searchItem)
        l.addArrangedSubview(filterView)
        
        filterView.widthAnchor.constraint(equalTo: searchItem.widthAnchor , multiplier: 0.5).isActive = true
        
        return l
    }()
    
    let collectionView : UICollectionView = {
        let layout = ResizingFlowLayout(insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        layout.height = 250
        
        let l = UICollectionView(frame: .zero , collectionViewLayout: layout)
        l.backgroundColor = .white
        l.register(CellBook.self , forCellWithReuseIdentifier: CellBook.getIdentifier())
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
        addSubview(stackViewSearch)
        addSubview(collectionView)
        
        navigation.anchor(top: topAnchor , leading: leadingAnchor , trailing: trailingAnchor )
        stackViewSearch.anchor(top: navigation.bottomAnchor , leading: leadingAnchor , trailing: trailingAnchor , paddingTop: 16, paddingLeft: 16 , paddingRight: 16 , height: 50 )
        collectionView.anchor(top: stackViewSearch.bottomAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor , paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8 )
        
    }
    
    
    func setDelegates (delegate : SearchVC?) {
        collectionView.delegate = delegate
        collectionView.dataSource = delegate
        navigation.delegateNavigation = delegate
        searchItem.textField.delegate = delegate
    }
    
    func setSearchBlink (blink : String?) {
        guard let blink = blink else {
            return
        }
        searchItem.textField.text = blink
        
    }
    
    func addPickerView () {
        
        
        addSubview(filterView.pickerViewFilter)
        addSubview(filterView.toolbar)
        
        filterView.pickerViewFilter.anchor( leading: leadingAnchor , bottom: self.bottomAnchor , trailing: trailingAnchor , paddingLeft: 0, paddingBottom: 0, paddingRight: 0 )
        
        filterView.toolbar.anchor( leading: leadingAnchor , bottom: filterView.pickerViewFilter.topAnchor , trailing: trailingAnchor , height: 50 )
        
        
    }
    
    func removePickerView () {
        filterView.pickerViewFilter.removeFromSuperview()
        filterView.toolbar.removeFromSuperview()
    }
    
}

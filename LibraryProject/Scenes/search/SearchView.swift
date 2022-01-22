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
    
    private let searchItem : SearchItemView = {
        let l = SearchItemView()
        return l
    }()
    
    private let collectionView : UICollectionView = {
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
        addSubview(searchItem)
        addSubview(collectionView)
        
        navigation.anchor(top: topAnchor , leading: leadingAnchor , trailing: trailingAnchor )
        searchItem.anchor(top: navigation.bottomAnchor , leading: leadingAnchor , trailing: trailingAnchor , paddingTop: 16, paddingLeft: 16 , paddingRight: 16 , height: 50 )
        collectionView.anchor(top: searchItem.bottomAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor , paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8 )
        
    }
    
    
    func setDelegates (delegate : SearchVC?) {
        collectionView.delegate = delegate
        collectionView.dataSource = delegate
        navigation.delegateNavigation = delegate
        searchItem.textField.delegate = delegate
    }
    
}

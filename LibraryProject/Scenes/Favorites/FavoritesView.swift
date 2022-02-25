//
//  FavoritesView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 25/02/2022.
//VC

import UIKit


class FavoritesView : UIView {
    
    private let navigation : NavigationBar = {
        let l = NavigationBar()
        l.labelTitle.text = SString.favorite
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
        addSubview(collectionView)
        
        navigation.anchor(top: topAnchor , leading: leadingAnchor , trailing: trailingAnchor )
        collectionView.anchor(top: navigation.bottomAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor , paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8 )
        
    }
    
    
    func setDelegates (delegate : FavoritesVC?) {
        collectionView.delegate = delegate
        collectionView.dataSource = delegate
        navigation.delegateNavigation = delegate
    }
    
    
}

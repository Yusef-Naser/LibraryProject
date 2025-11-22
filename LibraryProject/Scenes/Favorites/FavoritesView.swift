//
//  FavoritesView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 25/02/2022.
//VC

import UIKit


class FavoritesView : UIView {
    
    let topSafeArea = UIApplication.shared.keyWindow?.safeAreaInsets.top
    
    private let titleFavorite : LLabel = {
        let l = LLabel(isBold: true , fontSize: .size_20)
        l.text = SString.favorite
        return l
    }()
    
//    let collectionView : UICollectionView = {
//        let layout = ResizingFlowLayout(insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
//        layout.height = 250
//        
//        let l = UICollectionView(frame: .zero , collectionViewLayout: layout)
//        l.backgroundColor = .white
//        l.register(FavoriteCell.self , forCellWithReuseIdentifier: FavoriteCell.getIdentifier())
//        return l
//    }()
    
    let tableView : UITableView = {
        let l = UITableView()
        l.tableFooterView = UIView()
        l.register(FavoriteCell.self , forCellReuseIdentifier: FavoriteCell.getIdentifier() )
        l.separatorStyle = .none
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
        addSubview(titleFavorite)
        addSubview(tableView)
        
        titleFavorite.anchor(top: topAnchor , leading: leadingAnchor , trailing: trailingAnchor , paddingTop: (topSafeArea ?? 0) + 16 , paddingLeft: 16 )
        tableView.anchor(top: titleFavorite.bottomAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor , paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8 )
        
    }
    
    
    func setDelegates (delegate : FavoritesVC?) {
        tableView.delegate = delegate
        tableView.dataSource = delegate
    }
    
    
}

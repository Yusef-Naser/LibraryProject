//
//  ListCheckoutView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 09/02/2022.
//VC

import UIKit


class ListCheckoutView : UIView {
    
    let navigation : NavigationBar = {
        let l = NavigationBar()
        l.labelTitle.text = SString.checkoutList
        return l
    }()
    
    let tableView : UITableView = {
        let l = UITableView()
        l.register(CellCheckout.self , forCellReuseIdentifier: CellCheckout.getIdentifier())
        l.tableFooterView = UIView()
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
        addSubview(tableView)
        
        
        navigation.anchor(top: topAnchor , leading: leadingAnchor , trailing: trailingAnchor )
        tableView.anchor(top: navigation.bottomAnchor , leading: leadingAnchor , bottom: safeAreaLayoutGuide.bottomAnchor , trailing: trailingAnchor , paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8 )
        
    }
    
    func setDelegates (delegate : ListCheckoutVC?) {
        tableView.delegate = delegate
        tableView.dataSource = delegate
        navigation.delegateNavigation = delegate
    }
    
    func setTitle (screenType : ScreenType) {
        switch screenType {
        case .checkout:
            navigation.labelTitle.text = SString.checkoutList
        case .hold:
            navigation.labelTitle.text = SString.holdList
        case .none :
            return
        }
    }
    
}

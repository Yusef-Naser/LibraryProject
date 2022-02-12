//
//  SuggestionsView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 12/02/2022.
//VC

import UIKit


class SuggestionsView : UIView {
    
    let navigation : NavigationBar = {
        let l = NavigationBar()
        l.labelTitle.text = SString.suggestions
        return l
    }()
    
    let tableView : UITableView = {
        let l = UITableView()
        l.tableFooterView = UIView()
        l.register(CellSuggest.self , forCellReuseIdentifier: CellSuggest.getIdentifier() )
        return l
    }()
    
    private let buttonAddSuggest : LButton = {
        let l = LButton()
        l.setTitle(SString.addSuggest , for: .normal )
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
        addSubview(buttonAddSuggest)
        
        navigation.anchor(top: topAnchor , leading: leadingAnchor , trailing: trailingAnchor )
        tableView.anchor(top: navigation.bottomAnchor , leading: leadingAnchor , bottom: buttonAddSuggest.topAnchor , trailing: trailingAnchor , paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8 )
        buttonAddSuggest.anchor( leading: leadingAnchor , bottom: safeAreaLayoutGuide.bottomAnchor, trailing: trailingAnchor , paddingLeft: 16, paddingBottom: 16, paddingRight: 16 )
        
    }
    
    func setDelegate (delegate : SuggestionsVC?) {
        navigation.delegateNavigation = delegate
        tableView.delegate = delegate
        tableView.dataSource = delegate
    }
    
}

//
//  BranchesView.swift
//  LibraryProject
//
//  Created by yusef naser on 23/11/2025.
//

import UIKit

class BranchesView : UIView {
    
    private let navigation : NavigationBar = {
        let l = NavigationBar()
        l.labelTitle.text = SString.branches
        return l
    }()
    
    let tableView : UITableView = {
        let l = UITableView()
        l.tableFooterView = UIView()
        l.register(CellBranch.self , forCellReuseIdentifier: CellBranch.getIdentifier() )
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
    
    func initViews () {
        addConstraints()
    }
    
    func addConstraints () {
        addSubview(navigation)
        addSubview(tableView)
        
        navigation.anchor(top: topAnchor , leading: leadingAnchor , trailing: trailingAnchor)
        tableView.anchor(top: navigation.bottomAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor , paddingTop: 16 ,paddingLeft: 16, paddingRight: 16)
    }
    
    func setDelegate(delegate : BranchesVC) {
        navigation.delegateNavigation = delegate
        tableView.delegate = delegate
        tableView.dataSource = delegate
    }
    
}

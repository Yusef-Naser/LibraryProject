//
//  FilterVCView.swift
//  LibraryProject
//
//  Created by yusef naser on 17/11/2025.
//

import UIKit

class FilterVCView : UIView {
        
    let topSafeArea = UIApplication.shared.keyWindow?.safeAreaInsets.top
    
    let close : UIButton = {
        let l = UIButton()
        l.setImage(UIImage(named: "close"), for: .normal)
        return l
    }()
    
    private let labelTitle : LLabel = {
        let l = LLabel(isBold: true , fontSize: .size_16)
        l.text = SString.filter
        return l
    }()
    
    let tableView : UITableView = {
        let l = UITableView()
        l.tableFooterView = UIView()
        l.register(FilterCell.self , forCellReuseIdentifier: FilterCell.getIdentifier() )
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
        addSubview(labelTitle)
        addSubview(close)
        addSubview(tableView)
        
        labelTitle.anchor(top: topAnchor , centerX: self.centerXAnchor , paddingTop: 16)
        close.anchor( leading: leadingAnchor , centerY: labelTitle.centerYAnchor , paddingLeft: 16 )
        
        tableView.anchor(top: labelTitle.bottomAnchor , leading: leadingAnchor , bottom: bottomAnchor, trailing: trailingAnchor , paddingTop: 8)
    }
    
}

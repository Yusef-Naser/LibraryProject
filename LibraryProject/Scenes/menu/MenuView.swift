//
//  MenuView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//VC

import UIKit


class MenuView : UIView {
    
    var alertView : UIAlertController?
    
    private let navigation : NavigationBar = {
        let l = NavigationBar()
        l.hideBackButton()
        l.labelTitle.text = SString.menu
        return l
    }()
    
    let tableView : UITableView = {
        let l = UITableView()
        l.register(CellMenu.self , forCellReuseIdentifier: CellMenu.getIdentifier())
        l.tableFooterView = UIView()
        return l
    }()
    
    lazy var datePicker: UIDatePicker = {
      let datePicker = UIDatePicker(frame: .zero)
      datePicker.datePickerMode = .date
      datePicker.timeZone = TimeZone.current
        if #available(iOS 14, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
      return datePicker
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
        
        tableView.anchor(top: navigation.bottomAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor , paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16 )
    }
    
    
}

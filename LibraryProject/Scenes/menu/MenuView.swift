//
//  MenuView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//VC

import UIKit


class MenuView : UIView {
    
    let topSafeArea = UIApplication.shared.keyWindow?.safeAreaInsets.top

    
    var alertView : UIAlertController?
    
    private let labelTitle : LLabel = {
        let l = LLabel(isBold: true , fontSize: .size_20)
        l.text = SString.more
        return l
    }()
    
    private let labelLetter : LLabel = {
        let l = LLabel(isBold: true , fontSize: .size_24)
        l.textColor = Colors.colorPrimary
        return l
    }()
    
    private lazy var imageProfile : UIImageView = {
        let l = UIImageView()
        l.image = UIImage(named: "circleProfile")
        l.addSubview(labelLetter)
        labelLetter.anchor(centerX: l.centerXAnchor , centerY: l.centerYAnchor)
        return l
    }()
    
    private let labelUserName : LLabel = {
        let l = LLabel(isBold: true , fontSize: .size_16)
        l.textColor = Colors.colorGrayText
        return l
    }()
    
    private let labelUserID : LLabel = {
        let l = LLabel(isBold: false , fontSize: .size_14)
        l.textColor = Colors.colorPrimary
        return l
    }()
    
    private lazy var stackViewProfile : UIStackView = {
        let l = UIStackView()
        l.axis = .vertical
        l.spacing = 5
        l.distribution = .fillEqually
        
        l.addArrangedSubview(labelUserName)
        l.addArrangedSubview(labelUserID)
        
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
        addSubview(labelTitle)
        addSubview(imageProfile)
        addSubview(stackViewProfile)
        addSubview(tableView)
        
        labelTitle.anchor(top: topAnchor , leading: leadingAnchor , paddingTop: (topSafeArea ?? 0) + 16 , paddingLeft: 16)
        
        imageProfile.anchor(top: labelTitle.bottomAnchor , leading: leadingAnchor , paddingTop: 16 , paddingLeft: 16)
        stackViewProfile.anchor(top: imageProfile.topAnchor , leading: imageProfile.trailingAnchor , bottom: imageProfile.bottomAnchor, centerY: imageProfile.centerYAnchor , paddingLeft: 16)
        
        tableView.anchor(top: imageProfile.bottomAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor , paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16 )
    }
    
    func setUserName (name : String?){
        labelUserName.text = name
        labelLetter.text = name?.first.map { String($0).uppercased() } ?? ""
    }
    
    func setUserID (id: String? ) {
        labelUserID.text = id
    }
    
    
}

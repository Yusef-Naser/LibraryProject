//
//  CellBranch.swift
//  LibraryProject
//
//  Created by yusef naser on 23/11/2025.
//

import UIKit

class CellBranch : UITableViewCell {
    
    private let labelTitle : LLabel = {
        let l = LLabel(isBold: true , fontSize: .size_18)
        return l
    }()
    
    private let labelCountry_city_state : LLabel = {
        let l = LLabel(isBold: false , fontSize: .size_12)
        return l
    }()
    
    private let itemAddress : ViewItemBranche = {
        let l = ViewItemBranche()
        return l
    }()
    
    private let itemEmail : ViewItemBranche = {
        let l = ViewItemBranche()
        return l
    }()
    
    private let itemFax : ViewItemBranche = {
        let l = ViewItemBranche()
        return l
    }()
    
    private let itemPostalCode : ViewItemBranche = {
        let l = ViewItemBranche()
        return l
    }()
    
    private lazy var stackView : UIStackView = {
        let l = UIStackView()
        l.axis = .vertical
        l.spacing = 5
        l.distribution = .fillEqually
        
        l.addArrangedSubview(itemAddress)
        l.addArrangedSubview(itemEmail)
        l.addArrangedSubview(itemFax)
        l.addArrangedSubview(itemPostalCode)
        
        return l
    }()
    
    private lazy var viewBorder : UIView = {
        let l = UIView()
        l.layer.borderWidth = 1.5
        l.layer.borderColor = Colors.colorBorder.cgColor
        l.layer.cornerRadius = 10
        l.clipsToBounds = true
        
        l.addSubview(labelTitle)
        l.addSubview(labelCountry_city_state)
        l.addSubview(stackView)
        
        
        labelTitle.anchor(top: l.topAnchor , leading: l.leadingAnchor , trailing: l.trailingAnchor , paddingTop: 8 , paddingLeft: 8 , paddingRight: 8)
        labelCountry_city_state.anchor(top: labelTitle.bottomAnchor , leading: labelTitle.leadingAnchor , trailing: labelTitle.trailingAnchor , paddingTop: 8 , paddingLeft: 4 , paddingRight: 4)
        
        stackView.anchor(top: labelCountry_city_state.bottomAnchor , leading: labelTitle.leadingAnchor , bottom: l.bottomAnchor , trailing: labelTitle.trailingAnchor , paddingTop: 8 , paddingBottom: 8)
        
        return l
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initViews()
    }
    
    func initViews () {
        addConstraints()
        self.selectionStyle = .none
        
        
    }
    
    func addConstraints () {
        self.contentView.addSubview(viewBorder)
    
        viewBorder.anchor(top: contentView.topAnchor , leading: contentView.leadingAnchor , bottom: contentView.bottomAnchor , trailing: contentView.trailingAnchor , paddingTop: 4 , paddingBottom: 4)
    }
    
    func setTitle (title : String?) {
        labelTitle.text = title
    }
    
    func setCountry(country : String? , city : String? , state : String?) {
        labelCountry_city_state.text = "\(country ?? ""),\(city ?? ""),\(state ?? "")"
    }
    
    func setAddress (icon : String , title : String , value : String) {
        itemAddress.setData(icon: icon, title: title, value: value)
    }
    
    func setEmail (icon : String , title : String , value : String) {
        itemEmail.setData(icon: icon, title: title, value: value)
    }
    
    func setFax (icon : String , title : String , value : String) {
        itemFax.setData(icon: icon, title: title, value: value)
    }
    
    func setPostalCode (icon : String , title : String , value : String) {
        itemPostalCode.setData(icon: icon, title: title, value: value)
    }
    
    
    
}


class ViewItemBranche : UIView {
    
    private let icon : UIImageView = {
        let l = UIImageView()
        return l
    }()
    
    private let labelTitle : LLabel = {
        let l = LLabel(isBold: false , fontSize: .size_14)
        l.textColor = Colors.colorTextTextField
        return l
    }()
    
    private let labelValue : LLabel = {
        let l = LLabel(isBold: false , fontSize: .size_14)
        l.textColor = Colors.colorGrayText
        return l
    }()
    
    private lazy var stackView : UIStackView = {
        let l = UIStackView()
        l.axis = .vertical
        l.spacing = 5
        l.distribution = .fillEqually
        
        l.addArrangedSubview(labelTitle)
        l.addArrangedSubview(labelValue)
        
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
        self.isHidden = true
    }
    
    func addConstraints () {
        self.addSubview(icon)
        self.addSubview(stackView)
        
        icon.anchor(leading: leadingAnchor ,centerY: centerYAnchor , width: 30 , height: 30 )
        stackView.anchor(top: topAnchor , leading: icon.trailingAnchor , bottom: bottomAnchor , trailing: trailingAnchor , paddingTop: 2 , paddingLeft: 8 , paddingBottom: 2 , paddingRight: 8)
    }
    
    func setData( icon : String , title : String , value : String ) {
        self.icon.image = UIImage(named: icon)
        self.labelTitle.text = title
        self.labelValue.text = value
        self.isHidden = (value == "") ?  true : false
    }
    
}

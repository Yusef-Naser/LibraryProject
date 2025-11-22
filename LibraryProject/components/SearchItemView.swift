//
//  SearchView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//

import UIKit

class SearchItemView : UIView {
    
    let textField : UITextField = {
        let l = UITextField()
        l.placeholder = SString.searchByBookName
        l.font = UIFont.regular(size: .size_16)
        return l
    }()
    
    private let iconSearch : UIImageView = {
        let l = UIImageView()
        l.image = #imageLiteral(resourceName: "search")
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
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.isUserInteractionEnabled = true
        textField.returnKeyType = .search
        
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.layer.borderColor = Colors.colorBorder.cgColor
        self.layer.masksToBounds = true
    }
    
    private func addViews () {
        
        addSubview(textField)
        addSubview(iconSearch)
        
        textField.anchor(top: topAnchor  , bottom: bottomAnchor , trailing: trailingAnchor , paddingTop: 8 , paddingBottom: 8, paddingRight: 8 , height: 40 )
        iconSearch.anchor( leading: leadingAnchor , trailing: textField.leadingAnchor, centerY: textField.centerYAnchor , paddingLeft: 8 , paddingRight: 8 , width: 25 , height: 25 )
        
    }
    
    func disableSearchText () {
        textField.isEnabled = false
        disableBorder()
    }
    
    func enableBorder() {
        self.layer.borderColor = Colors.colorPrimary.cgColor
    }
    
    func disableBorder() {
        self.layer.borderColor = Colors.colorBorder.cgColor
    }
}

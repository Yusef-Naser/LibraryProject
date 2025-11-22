//
//  CellCheckout.swift
//  LibraryProject
//
//  Created by Yusef Naser on 09/02/2022.
//

import UIKit

class CellCheckout : UITableViewCell {
    
    
    private let containerView : UIView = {
        let l = UIView()
        l.backgroundColor = Colors.grayColors
        l.layer.cornerRadius = 10
        l.clipsToBounds = true
        return l
    }()
    
    let labelTitle : LLabel = {
        let l = LLabel(isBold: true , fontSize: .size_16)
        l.text = SString.title
        l.numberOfLines = 0
        l.textAlignment = .center
        return l
    }()
    
    let labelAuthor : LLabel = {
        let l = LLabel(isBold: true , fontSize: .size_16)
        l.text = SString.author + ":"
        l.numberOfLines = 0
        return l
    }()
    
    let labelAuthorValue : LLabel = {
        let l = LLabel(isBold: false , fontSize: .size_16)
        l.text = SString.author
        l.numberOfLines = 0
        return l
    }()
    
    let labelItemType : LLabel = {
        let l = LLabel(isBold: true , fontSize: .size_16)
        l.text = SString.itemType + ":"
        l.numberOfLines = 0
        return l
    }()
    
    let labelItemTypeValue : LLabel = {
        let l = LLabel(isBold: false , fontSize: .size_16)
        l.text = "itemType"
        l.numberOfLines = 0
        return l
    }()
    
    
    let labelCallNumber : LLabel = {
        let l = LLabel(isBold: true , fontSize: .size_16)
        l.text = SString.callNumber + ":"
        l.numberOfLines = 0
        return l
    }()
    
    
    let labelCallNumberValue : LLabel = {
        let l = LLabel(isBold: false , fontSize: .size_16)
        l.text = "call number"
        l.numberOfLines = 0
        return l
    }()
    
    private lazy var stackAuthor : UIStackView = {
        let l = UIStackView()
        l.spacing = 5
        l.axis = .horizontal
        
        l.addArrangedSubview(labelAuthor)
        l.addArrangedSubview(labelAuthorValue)
        
        labelAuthor.widthAnchor.constraint(equalTo: labelAuthorValue.widthAnchor, multiplier: 0.5).isActive = true
        
        return l
    }()
    
    private lazy var stackItemType : UIStackView = {
        let l = UIStackView()
        l.spacing = 5
        l.axis = .horizontal
        
        l.addArrangedSubview(labelItemType)
        l.addArrangedSubview(labelItemTypeValue)
        
        labelItemType.widthAnchor.constraint(equalTo: labelItemTypeValue.widthAnchor, multiplier: 0.5).isActive = true
        
        return l
    }()
    
    private lazy var stackCallNumber : UIStackView = {
        let l = UIStackView()
        l.spacing = 5
        l.axis = .horizontal
        
        l.addArrangedSubview(labelCallNumber)
        l.addArrangedSubview(labelCallNumberValue)
        
        labelCallNumber.widthAnchor.constraint(equalTo: labelCallNumberValue.widthAnchor, multiplier: 0.5).isActive = true
        
        return l
    }()
    
    
    private lazy var stackAllViews : UIStackView = {
        let l = UIStackView()
        l.spacing = 15
        l.axis = .vertical
        l.distribution = .fillEqually
        
        l.addArrangedSubview(stackAuthor)
        l.addArrangedSubview(stackItemType)
        l.addArrangedSubview(stackCallNumber)
        
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
    
    private func initViews () {
        addViews()
        self.selectionStyle = .none
    }
    
    private func addViews () {
        
        contentView.addSubview(containerView)
        
        containerView.anchor(top: contentView.topAnchor , leading: contentView.leadingAnchor , bottom: contentView.bottomAnchor , trailing: contentView.trailingAnchor , paddingTop: 8 , paddingLeft: 16 , paddingBottom: 8, paddingRight: 16 )
        
        containerView.addSubview(labelTitle)
//        contentView.addSubview(labelAuthor)
//        contentView.addSubview(labelAuthorValue)
//        contentView.addSubview(labelItemType)
//        contentView.addSubview(labelItemTypeValue)
//        contentView.addSubview(labelCallNumber)
//        contentView.addSubview(labelCallNumberValue)
        
        containerView.addSubview(stackAllViews)
        
        labelTitle.anchor(top: containerView.topAnchor , leading: containerView.leadingAnchor , trailing: containerView.trailingAnchor , paddingTop: 8, paddingLeft: 8 , paddingRight: 8 )

        stackAllViews.anchor(top: labelTitle.bottomAnchor , leading: containerView.leadingAnchor , bottom: containerView.bottomAnchor , trailing: containerView.trailingAnchor , paddingTop: 16 , paddingLeft: 16, paddingBottom: 16, paddingRight: 16 )
        
//        labelAuthor.anchor(top: labelTitle.bottomAnchor , leading: contentView.leadingAnchor , trailing: contentView.trailingAnchor , paddingTop: 8, paddingLeft: 8 , paddingRight: 8)
//        labelCallNumber.anchor(top: labelAuthor.bottomAnchor , leading: contentView.leadingAnchor , trailing: contentView.trailingAnchor , paddingTop: 8, paddingLeft: 8 , paddingRight: 8 )
//
//        labelItemType.anchor(top: labelCallNumber.bottomAnchor , leading: contentView.leadingAnchor , bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor  , paddingTop: 8 , paddingLeft : 8, paddingBottom: 8 ,paddingRight: 8 )
        
    }
    
}

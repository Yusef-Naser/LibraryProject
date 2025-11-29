//
//  CellCheckout.swift
//  LibraryProject
//
//  Created by Yusef Naser on 09/02/2022.
//

import UIKit

class CellCheckout : UITableViewCell {
    
    
    private let imageBook : UIImageView = {
        let l = UIImageView()
        l.contentMode = .scaleAspectFill
        l.layer.cornerRadius = 10
        l.clipsToBounds = true
        return l
    }()
    
    private let labelTitle : LLabel = {
        let l = LLabel(isBold: true , fontSize: .size_14)
        l.numberOfLines = 0
        return l
    }()

    
    private let labelAuthor : LLabel = {
        let l = LLabel(isBold: false , fontSize: .size_12)
        l.numberOfLines = 0
        return l
    }()
    
    private let labelHoldDate : LLabel = {
        let l = LLabel(isBold: false , fontSize: .size_12)
        l.numberOfLines = 0
        l.textColor = Colors.colorPrimary
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
    }
    
    private func addViews () {
        self.selectionStyle = .none
        contentView.addSubview(imageBook)
        contentView.addSubview(labelTitle)
        contentView.addSubview(labelAuthor)
        contentView.addSubview(labelHoldDate)
        
        imageBook.anchor(top: contentView.topAnchor , leading: contentView.leadingAnchor , bottom: contentView.bottomAnchor , paddingTop: 8 , paddingBottom: 8 , paddingRight: 8 , height: 130 )
        imageBook.widthAnchor.constraint(equalTo: self.contentView.widthAnchor , multiplier: 0.3).isActive = true
        
        labelTitle.anchor(top: imageBook.topAnchor , leading: imageBook.trailingAnchor , trailing: contentView.trailingAnchor , paddingTop: 16, paddingLeft: 8, paddingBottom: 8, paddingRight: 8 )
        
        labelAuthor.anchor(top: labelTitle.bottomAnchor , leading: labelTitle.leadingAnchor , trailing: labelTitle.trailingAnchor , paddingTop: 10)
        
        labelHoldDate.anchor(top: labelAuthor.bottomAnchor , leading: labelTitle.leadingAnchor , trailing: labelTitle.trailingAnchor , paddingTop: 10)
        
        
    }
    
    func setTitle (title : String? ) {
        labelTitle.text = title
    }
    
    func setImage (image : String?) {
        imageBook.loadImage(url:  image ?? "" )
    }
    
    func setAuthor (author : String?) {
        labelAuthor.text = SString.by + ": " + (author ?? "")
    }
    
    func setHoldDate (date : String?) {
        guard let date = date else {
            labelHoldDate.isHidden = true
            return
        }
        labelHoldDate.isHidden = false
        labelHoldDate.text = SString.holdDate + ": " + date
    }
    
}

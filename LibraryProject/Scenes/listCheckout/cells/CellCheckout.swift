//
//  CellCheckout.swift
//  LibraryProject
//
//  Created by Yusef Naser on 09/02/2022.
//

import UIKit

class CellCheckout : UITableViewCell {
    
    let labelTitle : UILabel = {
        let l = UILabel()
        l.text = SString.title
        l.numberOfLines = 0
        l.text = "title"
        return l
    }()
    
    let labelAuthor : UILabel = {
        let l = UILabel()
        l.text = SString.author
        l.numberOfLines = 0
        l.text = "author"
        return l
    }()
    
    let labelItemType : UILabel = {
        let l = UILabel()
        l.text = "itemType"
        return l
    }()
    
    let labelCallNumber : UILabel = {
        let l = UILabel()
        l.text = "call number"
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
        
        contentView.addSubview(labelTitle)
        contentView.addSubview(labelAuthor)
        contentView.addSubview(labelItemType)
        contentView.addSubview(labelCallNumber)
        
        labelTitle.anchor(top: contentView.topAnchor , leading: contentView.leadingAnchor , trailing: contentView.trailingAnchor , paddingTop: 8, paddingLeft: 8 , paddingRight: 8 )

        labelAuthor.anchor(top: labelTitle.bottomAnchor , leading: contentView.leadingAnchor , trailing: contentView.trailingAnchor , paddingTop: 8, paddingLeft: 8 , paddingRight: 8)
        labelCallNumber.anchor(top: labelAuthor.bottomAnchor , leading: contentView.leadingAnchor , trailing: contentView.trailingAnchor , paddingTop: 8, paddingLeft: 8 , paddingRight: 8 )
        
        labelItemType.anchor(top: labelCallNumber.bottomAnchor , leading: contentView.leadingAnchor , bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor  , paddingTop: 8 , paddingLeft : 8, paddingBottom: 8 ,paddingRight: 8 )
        
    }
    
}

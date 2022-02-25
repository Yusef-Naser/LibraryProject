//
//  CellSuggest.swift
//  LibraryProject
//
//  Created by Yusef Naser on 12/02/2022.
//

import UIKit

class CellSuggest : UITableViewCell {
    
    private let labelTitle : UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        return l
    }()
    
    private let labelAuthor : UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        return l
    }()
    
    private let labelLibrary : UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
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
        contentView.addSubview(labelLibrary)
        
        labelTitle.anchor(top: contentView.topAnchor , leading: contentView.leadingAnchor , trailing: contentView.trailingAnchor , paddingTop: 16, paddingLeft: 16, paddingBottom: 16 , paddingRight: 16 )
        labelAuthor.anchor(top: labelTitle.bottomAnchor , leading: contentView.leadingAnchor , trailing: contentView.trailingAnchor , paddingTop: 16, paddingLeft: 16 , paddingRight: 16 )
        
        labelLibrary.anchor(top: labelAuthor.bottomAnchor , leading: contentView.leadingAnchor , bottom: contentView.bottomAnchor , trailing: contentView.trailingAnchor , paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16 )
        
    }
    
    func setTitle (title : String?) {
        labelTitle.text = title
    }
    
    func setAuthor (author : String?) {
        labelAuthor.text = author
    }
    
    func setLibrary (library : String?) {
        labelLibrary.text = library
    }
}

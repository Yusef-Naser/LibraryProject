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
        
        labelTitle.anchor(top: contentView.topAnchor , leading: contentView.leadingAnchor , bottom: contentView.bottomAnchor , trailing: contentView.trailingAnchor , paddingTop: 16, paddingLeft: 16, paddingBottom: 16 , paddingRight: 16 )
        
    }
    
    func setTitle (title : String?) {
        labelTitle.text = title
    }
    
}

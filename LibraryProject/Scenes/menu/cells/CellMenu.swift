//
//  CellMenu.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//

import UIKit

class CellMenu : UITableViewCell {
    
    private let titleLabel : UILabel = {
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
        self.contentView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.selectionStyle = .none
    }
    
    private func addViews () {
        
        contentView.addSubview(titleLabel)
        titleLabel.anchor(top: contentView.topAnchor , leading: contentView.leadingAnchor , bottom: contentView.bottomAnchor , trailing: contentView.trailingAnchor , paddingTop: 4, paddingLeft: 4, paddingBottom: 4, paddingRight: 4 )
        
        
    }
    
    func setTitle (title : String?) {
        titleLabel.text = title
    }
    
}

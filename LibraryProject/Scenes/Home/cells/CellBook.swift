//
//  CellBook.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//

import UIKit

class CellBook : UICollectionViewCell {
    
    private let imageBook : UIImageView = {
        let l = UIImageView()
        l.contentMode = .scaleAspectFill
        l.layer.cornerRadius = 10
        l.clipsToBounds = true
        return l
    }()
    
    private let labelTitle : UILabel = {
        let l = UILabel()
        
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
    }
    
    private func addViews () {
        
        contentView.addSubview(imageBook)
        contentView.addSubview(labelTitle)
        
        imageBook.anchor(top: contentView.topAnchor , leading: contentView.leadingAnchor , bottom: labelTitle.topAnchor , trailing: contentView.trailingAnchor , paddingTop: 8, paddingLeft: 8 , paddingBottom: 8 , paddingRight: 8 )
        
        labelTitle.anchor( leading: contentView.leadingAnchor , bottom: contentView.bottomAnchor , trailing: contentView.trailingAnchor , paddingLeft: 8, paddingBottom: 8, paddingRight: 8 )
        labelTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true 
        
    }
    
    func setTitle (title : String?) {
        labelTitle.text = title
    }
    
    func setImage (image : String?) {
        imageBook.loadImage(url: image ?? "")
    }
    
    
}

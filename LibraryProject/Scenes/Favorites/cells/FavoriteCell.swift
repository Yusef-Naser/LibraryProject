//
//  FavoriteCell.swift
//  LibraryProject
//
//  Created by yusef naser on 14/11/2025.
//

import UIKit

protocol FavoriteCellDelegate : AnyObject {
    func actionFavorite (cell : FavoriteCell)
}

class FavoriteCell : UITableViewCell {
    
    weak var delegateCell : FavoriteCellDelegate?
    
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
    
    let buttonFavorite : UIButton = {
        let l = UIButton()
        l.setImage(#imageLiteral(resourceName: "unfavorite"), for: .normal )
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
        buttonFavorite.addTarget(self , action: #selector( actionFavorite ), for: .touchUpInside)
    }
    
    private func addViews () {
        self.selectionStyle = .none
        contentView.addSubview(imageBook)
        contentView.addSubview(labelTitle)
        contentView.addSubview(buttonFavorite)
        
        imageBook.anchor(top: contentView.topAnchor , leading: contentView.leadingAnchor , bottom: contentView.bottomAnchor , paddingTop: 8 , paddingBottom: 8 , paddingRight: 8 , height: 130 )
        imageBook.widthAnchor.constraint(equalTo: self.contentView.widthAnchor , multiplier: 0.3).isActive = true
        
        labelTitle.anchor(top: imageBook.topAnchor , leading: imageBook.trailingAnchor , trailing: buttonFavorite.leadingAnchor , paddingTop: 16, paddingLeft: 8, paddingBottom: 8, paddingRight: 8 )
        
        buttonFavorite.anchor(top: contentView.topAnchor , trailing: contentView.trailingAnchor , paddingTop: 8, paddingRight: 8 , width: 40 , height: 40 )
        
    }
    
    func setTitle (title : String? ) {
        labelTitle.text = title
    }
    
    func setImage (image : String?) {
        imageBook.loadImage(url:  image ?? "" )
    }
    
    
    @objc private func actionFavorite () {
        delegateCell?.actionFavorite(cell: self)
    }
}

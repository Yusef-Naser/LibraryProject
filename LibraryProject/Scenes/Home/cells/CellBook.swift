//
//  CellBook.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//

import UIKit

protocol CellBookDelegate : AnyObject {
    func actionFavorite (cell : CellBook)
}

class CellBook : UICollectionViewCell {
    
    weak var delegateCell : CellBookDelegate?
    
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
    
    let buttonFavorite : UIButton = {
        let l = UIButton()
        l.setImage(#imageLiteral(resourceName: "Path 37"), for: .normal )
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
        buttonFavorite.addTarget(self , action: #selector( actionFavorite ), for: .touchUpInside)
    }
    
    private func addViews () {
        
        contentView.addSubview(imageBook)
        contentView.addSubview(labelTitle)
        contentView.addSubview(buttonFavorite)
        
        imageBook.anchor(top: contentView.topAnchor , leading: contentView.leadingAnchor , bottom: labelTitle.topAnchor , trailing: contentView.trailingAnchor , paddingTop: 8, paddingLeft: 8 , paddingBottom: 8 , paddingRight: 8 )
        
        labelTitle.anchor( leading: contentView.leadingAnchor , bottom: contentView.bottomAnchor , trailing: contentView.trailingAnchor , paddingLeft: 8, paddingBottom: 8, paddingRight: 8 )
        labelTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true 
        
        buttonFavorite.anchor(top: contentView.topAnchor , leading: contentView.leadingAnchor , paddingTop: 8, paddingLeft: 8 , width: 40 , height: 40 )
        
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

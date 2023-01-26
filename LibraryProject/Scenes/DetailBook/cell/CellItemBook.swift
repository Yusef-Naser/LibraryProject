//
//  CellItemBook.swift
//  LibraryProject
//
//  Created by Yusef Naser on 24/01/2022.
//

import UIKit

class CellItemBook : UITableViewCell {
    
    private let imageViewItem : UIImageView = {
        let l = UIImageView()
        l.contentMode = .scaleAspectFill
        l.layer.cornerRadius = 10
        l.clipsToBounds = true
        return l
    }()
    
    private let labelName : UILabel = {
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
    }
    
    private func addViews () {
        
      //  contentView.addSubview(imageViewItem)
        contentView.addSubview(labelName)
        
      //  imageViewItem.anchor(top: contentView.topAnchor , leading: contentView.leadingAnchor , bottom: contentView.bottomAnchor , paddingTop: 8, paddingLeft: 8 , paddingRight: 8 , width: 100 , height: 150 )
        labelName.anchor(top: contentView.topAnchor , leading: contentView.leadingAnchor , bottom: contentView.bottomAnchor , trailing: contentView.trailingAnchor  , paddingTop: 8 , paddingLeft: 8 , paddingBottom: 8 , paddingRight: 8 )
        
    }
    
    func setImage (image : String?) {
        imageViewItem.loadImage(url: image ?? "" )
    }
    
    func setTitle (title : String?) {
        labelName.text = title
    }
    
}

//
//  CellSlider.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//

import UIKit

class CellSlider : UICollectionViewCell {
    
    private let imageSlider : UIImageView = {
        let l = UIImageView()
        l.contentMode = .scaleAspectFill
        l.layer.cornerRadius = 10
        l.clipsToBounds = true 
        return l
    }()
    
    private let labelTitle : UILabel = {
        let l = UILabel()
        l.textAlignment = .center
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
        
        contentView.layer.cornerRadius = 10
        
        contentView.addSubview(imageSlider)
        contentView.addSubview(labelTitle)
        
        imageSlider.anchor(top: contentView.topAnchor , leading: contentView.leadingAnchor , bottom: labelTitle.topAnchor , trailing: contentView.trailingAnchor , paddingTop: 4, paddingLeft: 4, paddingBottom: 4, paddingRight: 4 , height: 100)
        
        labelTitle.anchor( leading: contentView.leadingAnchor , bottom: contentView.bottomAnchor , trailing: contentView.trailingAnchor , paddingTop: 8 , paddingLeft: 8 , paddingBottom: 8 , paddingRight: 8 , height: 20)
        
    }
    
    func setImage (image : UIImage?) {
        imageSlider.image = image
    }
    
    func setImage (image : String?) {
        imageSlider.loadImage(url: image ?? "")
    }
    
    func setTitle (title : String?) {
        labelTitle.text = title
    }
    
}

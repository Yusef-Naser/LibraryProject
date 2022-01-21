//
//  filterView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//

import UIKit

class FilterView : UIView {
    
    private let iconFilter : UIImageView = {
        let l = UIImageView()
        l.image = #imageLiteral(resourceName: "filter")
        return l
    }()
    
    private let labelFilter : UILabel = {
        let l = UILabel()
        l.text = SString.filter
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
        self.backgroundColor = Colors.grayColors
        self.layer.cornerRadius = 10
    }
    
    private func addViews () {
        
        addSubview(labelFilter)
        addSubview(iconFilter)
        
        iconFilter.anchor(top: topAnchor , bottom: bottomAnchor , trailing: trailingAnchor , paddingTop: 8 , paddingBottom: 8 , paddingRight: 8 , width: 25 , height: 50 )
        labelFilter.anchor(top: topAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: iconFilter.leadingAnchor , paddingTop: 8, paddingLeft: 8 , paddingBottom: 8 , paddingRight: 8 )
        
    }
    
}

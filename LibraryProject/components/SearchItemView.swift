//
//  SearchView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//

import UIKit

class SearchItemView : UIView {
    
    let textField : UITextField = {
        let l = UITextField()
        l.placeholder = SString.search
        return l
    }()
    
    private let iconSearch : UIImageView = {
        let l = UIImageView()
        l.image = #imageLiteral(resourceName: "search")
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
        self.isUserInteractionEnabled = true
        textField.returnKeyType = .search
    }
    
    private func addViews () {
        
        addSubview(textField)
        addSubview(iconSearch)
        
        textField.anchor(top: topAnchor , leading: leadingAnchor , bottom: bottomAnchor , paddingTop: 8, paddingLeft: 8 , paddingBottom: 8 , height: 50 )
        iconSearch.anchor( leading: textField.trailingAnchor , trailing: trailingAnchor, centerY: textField.centerYAnchor , paddingLeft: 8 , paddingRight: 8 , width: 25 , height: 25 )
        
    }
    
    func disableSearchText () {
        textField.isEnabled = false
    }
    
}

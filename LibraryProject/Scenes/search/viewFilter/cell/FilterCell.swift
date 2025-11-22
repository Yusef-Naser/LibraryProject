//
//  FilterCell.swift
//  LibraryProject
//
//  Created by yusef naser on 17/11/2025.
//

import UIKit

protocol FilterCellConfiguration {
    func setText (text : String)
}

class FilterCell : UITableViewCell {
    
    private let labelText : LLabel = {
        let l = LLabel(isBold: false , fontSize: .size_14)
        l.textColor = Colors.colorGrayText
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
    
    func initViews () {
        addConstraints()
    }
    
    func addConstraints () {
        contentView.addSubview(labelText)
        labelText.anchor(top: contentView.topAnchor , leading: contentView.leadingAnchor , bottom: contentView.bottomAnchor , trailing: contentView.trailingAnchor , paddingTop: 32 , paddingLeft: 16, paddingBottom: 32 , paddingRight: 16 )
    }
    
}

extension FilterCell : FilterCellConfiguration {
    func setText(text: String) {
        labelText.text = text
    }
}

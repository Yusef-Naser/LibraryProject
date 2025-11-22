//
//  EmptyView.swift
//  LibraryProject
//
//  Created by yusef naser on 16/11/2025.
//

import UIKit

class EmptyView : UIView {
    
    private let emptyImage : UIImageView = {
        let l = UIImageView()
        l.image = UIImage(named: "EmptyPage")
        l.contentMode = .scaleAspectFill
        l.clipsToBounds = true
        return l
    }()
    
    private let labelText : LLabel = {
        let l = LLabel(isBold: false , fontSize: .size_14)
        l.numberOfLines = 0
        l.textAlignment = .center
        return l
    }()
    
    init(text : String) {
        super.init(frame: CGRectZero)
        initViews()
        labelText.text = text
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        self.addSubview(emptyImage)
        self.addSubview(labelText)
        
        emptyImage.anchor(centerX: self.centerXAnchor , centerY: self.centerYAnchor)
        labelText.anchor(top: emptyImage.bottomAnchor , centerX: self.centerXAnchor , paddingBottom: 16)
        
    }
    
}

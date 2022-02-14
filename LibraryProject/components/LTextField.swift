//
//  LTextField.swift
//  LibraryProject
//
//  Created by yusef naser on 12/02/2022.
//

import UIKit

class LTextField : UITextField {
    
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
        self.borderStyle = .line
        self.layer.borderColor = Colors.grayColors.cgColor
        self.layer.borderWidth = 0.5

    }
    
    func addConstraints () {
        
    }
    
}

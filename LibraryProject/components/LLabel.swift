//
//  LLabel.swift
//  LibraryProject
//
//  Created by yusef naser on 08/11/2025.
//

import UIKit
class LLabel : UILabel {
    
    private var isBold = false
    private var fontSize : UIFont.FontSize = .size_18
    
    init (isBold : Bool = false , fontSize: UIFont.FontSize = .size_18 ) {
        super.init(frame: CGRectZero )
        self.isBold = isBold
        self.fontSize = fontSize
        self.addConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.addConstraints()
    }
    
    func addConstraints() {
        self.textColor = Colors.colorText
        updateFont()
    }
    
    private func updateFont() {
        if isBold {
            self.font = UIFont.bold(size: fontSize)
        } else {
            self.font = UIFont.regular(size: fontSize)
        }
    }
}

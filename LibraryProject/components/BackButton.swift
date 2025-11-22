//
//  BackButton.swift
//  LibraryProject
//
//  Created by yusef naser on 08/11/2025.
//

import UIKit

class BackButton : UIButton {
    
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
        if SharedData.instance.getLangauge().contains(LanguageEnum.en.rawValue) {
            self.setImage(#imageLiteral(resourceName: "left_arrow"), for: .normal)
        }else {
            self.setImage(#imageLiteral(resourceName: "right_arrow"), for: .normal)
        }
    }
    
}

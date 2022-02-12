//
//  LButton.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//

import UIKit

class LButton : UIButton {
    
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
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.layer.cornerRadius = 10
        self.backgroundColor = Colors.colorPrimary
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.setTitleColor(.black , for: .normal)
        
    }
    
    private func addViews () {
        
        
    }
    
}

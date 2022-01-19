//
//  MainTabBarView.swift
//  Library
//
//  Created by yusef naser on 18/01/2022.
//VC

import UIKit

class MainTabBarView : UIView {
    
    let containerView : UIView = {
        let v = UIView()
        return v
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
        
        self.addSubview(containerView)
        containerView.anchor(top: topAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor )
        
    }
    
    
}

//
//  MainTabBarView.swift
//  Library
//
//  Created by yusef naser on 18/01/2022.
//VC

import UIKit

class MainTabBarView : UIView {
    
    var containerView : UIView {
        let v = UIView()
        
        return v
    }
 
    
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
        containerView.translatesAutoresizingMaskIntoConstraints = false
        let v = containerView.centerXAnchor.constraint(equalTo: centerXAnchor)

        v.isActive = true
        
    //    containerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor ).isActive = true
      //  containerView.anchor(top: topAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor )
    }
    
    
}

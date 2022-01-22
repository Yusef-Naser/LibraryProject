//
//  NavigationBar.swift
//  LibraryProject
//
//  Created by Yusef Naser on 22/01/2022.
//

import UIKit

@objc protocol NavigationBarDelegate : AnyObject {
    @objc optional func navigationDismissView()
}

class NavigationBar : UIView {
    
    weak var delegateNavigation : NavigationBarDelegate?
    
    private let heightStatusBar = UIApplication.shared.statusBarFrame.height
    
    lazy var backButton : UIButton = {
       let b = UIButton ()
        b.addTarget( delegateNavigation , action: #selector(NavigationBarDelegate.navigationDismissView), for: .touchUpInside )
        b.setImage(#imageLiteral(resourceName: "left_arrow"), for: .normal)
        return b
    }()
    
    
    let labelTitle : UILabel = {
        let name = UILabel()
        name.textColor = .black
        name.font = UIFont.boldSystemFont(ofSize: 20)
        name.textAlignment = .center
        return name
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
        self.layer.cornerRadius = 30
        self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMinYCorner]
        self.heightAnchor.constraint(equalToConstant: heightStatusBar + 60 ).isActive = true
        self.backgroundColor = Colors.colorPrimary
    }
    
    private func addViews () {
        
        addSubview(backButton)
        addSubview(labelTitle)
        
        backButton.anchor( leading: leadingAnchor , bottom: self.bottomAnchor , paddingLeft: 8 , paddingBottom: 8 )

        labelTitle.anchor( centerX: self.centerXAnchor  ,  centerY: backButton.centerYAnchor )
        
    }
    
}

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
    
    private let topSafeArea = UIApplication.shared.keyWindow?.safeAreaInsets.top
    let screenWidth = UIApplication.shared.windows.first?.bounds.width ?? 0

    
    lazy var backButton : BackButton = {
       let b = BackButton ()
        b.addTarget( delegateNavigation , action: #selector(NavigationBarDelegate.navigationDismissView), for: .touchUpInside )
//        if SharedData.instance.getLangauge().contains(LanguageEnum.en.rawValue) {
//            b.setImage(#imageLiteral(resourceName: "left_arrow"), for: .normal)
//        }else {
//            b.setImage(#imageLiteral(resourceName: "right_arrow"), for: .normal)
//        }
        
        return b
    }()
    
    
    let labelTitle : LLabel = {
        let name = LLabel(isBold: true , fontSize: .size_20)
        name.textColor = .black
        name.textAlignment = .center
        return name
    }()
    
    private let viewLine : UIView = {
        let l = UIView()
        l.backgroundColor = Colors.colorBorder
        return l
    }()
    
//    private let imageLogo : UIImageView = {
//        let l = UIImageView()
//        l.image = UIImage(named: "logo")
//        l.clipsToBounds = true
//        l.contentMode = .scaleAspectFit
//        return l
//    }()
    
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
        self.heightAnchor.constraint(equalToConstant: (topSafeArea ?? 0) + 50 ).isActive = true
        self.backgroundColor = UIColor.clear
    }
    
    private func addViews () {
        
        addSubview(backButton)
        addSubview(labelTitle)
        addSubview(viewLine)
        
        backButton.anchor( leading: leadingAnchor , bottom: self.bottomAnchor , paddingLeft: 8 , paddingBottom: 24 )

        labelTitle.anchor( centerX: self.centerXAnchor  ,  centerY: backButton.centerYAnchor )
        
        viewLine.anchor(leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor , height: 1)
        
    }
    
    func hideBackButton () {
        backButton.isHidden = true
    }
    
}

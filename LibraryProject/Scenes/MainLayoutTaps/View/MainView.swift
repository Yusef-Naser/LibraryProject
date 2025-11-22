//
//  MainView.swift
//  LibraryProject
//
//  Created by yusef naser on 08/11/2025.
//

import UIKit

class MainView : UIView {
    
    private lazy var tabBar : TabBar = {
        let l = TabBar()
        l.selectedIndex = 0
        return l
    }()
    
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
    
    func initViews () {
        addConstraints()
    }
    
    func addConstraints () {
        self.addSubview(tabBar)
        tabBar.anchor(leading: self.leadingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor , trailing: self.trailingAnchor)
        
        self.addSubview(containerView)
        containerView.anchor(top: topAnchor , leading: leadingAnchor , bottom: tabBar.topAnchor , trailing: trailingAnchor )
    }
    
    func setDelegate (deledate:MainViewController){
        tabBar.delegate = deledate
    }
    
}
//
//extension MainView : TabBarDelegate {
//    func tabBar(_ tabBar: TabBar, didSelectTabAt index: Int) {
//        print("selectedIndex: \(index)")
//    }
//    
//}

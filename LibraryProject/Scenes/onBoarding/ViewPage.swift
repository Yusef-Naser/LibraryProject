//
//  ViewPage.swift
//  LibraryProject
//
//  Created by yusef naser on 28/11/2025.
//

import UIKit

class ViewPage : UIStackView {
    
    private var selectedPage = 0
    
    private let line1 : UIView = {
        let l = UIView()
        l.backgroundColor = .white
        l.layer.cornerRadius = 5
        l.clipsToBounds = true
        return l
    }()
    
    private let line2 : UIView = {
        let l = UIView()
        l.backgroundColor = .white
        l.layer.cornerRadius = 5
        l.clipsToBounds = true
        return l
    }()
    
    private let line3 : UIView = {
        let l = UIView()
        l.backgroundColor = .white
        l.layer.cornerRadius = 4
        l.clipsToBounds = true
        return l
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews () {
        addConstraints()
        
        self.backgroundColor = .clear
        self.spacing = 5
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.addArrangedSubview(line1)
        self.addArrangedSubview(line2)
        self.addArrangedSubview(line3)
        
        self.translatesAutoresizingMaskIntoConstraints = true
        self.heightAnchor.constraint(equalToConstant: 8).isActive = true
        
        setPage(page: selectedPage)
    }
    
    func addConstraints () {
       
    }
    
    func currentPage() -> Int {
        selectedPage
    }
    
    func setPage(page : Int) {
        switch page {
        case 0:
            selectedPage = 0
            line1.backgroundColor = Colors.colorPrimary
            line2.backgroundColor = .white
            line3.backgroundColor = .white
        case 1:
            selectedPage = 1
            line1.backgroundColor = .white
            line2.backgroundColor = Colors.colorPrimary
            line3.backgroundColor = .white
        case 2:
            selectedPage = 2
            line1.backgroundColor = .white
            line2.backgroundColor = .white
            line3.backgroundColor = Colors.colorPrimary
        default:
            selectedPage = 0
        }
    }
}

//
//  ViewBookDetail.swift
//  LibraryProject
//
//  Created by Yusef Naser on 22/01/2022.
//

import UIKit

class ViewBookDetail : UIView {
    
    private let labelTitle : UILabel = {
        let l = UILabel()
     //   l.font = UIFont.boldSystemFont(ofSize: 20)
        return l
    }()
    
    private let labelDetails : UILabel = {
        let l = UILabel()
        l.textColor = .gray
        l.numberOfLines = 0
        return l
    }()
    
    private let viewLine : UIView = {
        let l = UIView()
        l.backgroundColor = .gray
        return l
    }()
    
    init(title : String?) {
        super.init(frame: .zero)
        self.labelTitle.text = title
        initViews()
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
        addSubview(labelTitle)
        addSubview(labelDetails)
        addSubview(viewLine)
        
        labelTitle.anchor(top: topAnchor , leading: leadingAnchor , paddingTop: 8, paddingLeft: 8 )
        labelDetails.anchor(top: labelTitle.bottomAnchor , leading: leadingAnchor , trailing: trailingAnchor , paddingTop: 0, paddingLeft: 8, paddingBottom: 8, paddingRight: 8 )
        viewLine.anchor(top: labelDetails.bottomAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor , paddingTop: 4, paddingLeft: 8, paddingBottom: 0 , paddingRight: 8 , height: 1 )
        
    }
    
    func setDetails (details : String?) {
        labelDetails.text = details
    }
}

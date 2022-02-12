//
//  CellCheckout.swift
//  LibraryProject
//
//  Created by Yusef Naser on 09/02/2022.
//

import UIKit

class CellCheckout : UITableViewCell {
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initViews()
    }
    
    private func initViews () {
        addViews()
        self.selectionStyle = .none
    }
    
    private func addViews () {
        
        
    }
    
}

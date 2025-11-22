//
//  CellMenu.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//

import UIKit

protocol CellMenuDelegate : AnyObject {
    func actionCheckout ()
    func actionCheckin ()
}

class CellMenu : UITableViewCell {
    
    var delegateCell : CellMenuDelegate?
    private var heightStack : NSLayoutConstraint?
    
    private let titleLabel : LLabel = {
        let l = LLabel(isBold: false , fontSize: .size_18)
        
        return l
    }()
    
    let iconImage : UIImageView = {
        let l = UIImageView()
        
        return l
    }()
    
    let checkoutButton : LButton = {
        let l = LButton()
        l.setTitle(SString.checkout , for: .normal)
        return l
    }()
    
    let checkInButton : LButton = {
        let l = LButton()
        l.setTitle(SString.checkin, for: .normal)
        
        return l
    }()
    
    private lazy var stackView : UIStackView = {
        let l = UIStackView()
        l.spacing = 10
        l.axis = .horizontal
        l.distribution = .fillEqually
        l.addArrangedSubview(checkoutButton)
        l.addArrangedSubview(checkInButton)
        return l
    }()
    
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
        self.contentView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        heightStack = stackView.heightAnchor.constraint(equalToConstant: 50)
        heightStack?.isActive = true
        
        self.selectionStyle = .none
        checkInButton.addTarget(self , action: #selector(actionChechin), for: .touchUpInside)
        checkoutButton.addTarget(self , action: #selector(actionCheckout), for: .touchUpInside )
    }
    
    private func addViews () {
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(iconImage)
        contentView.addSubview(stackView)
        titleLabel.anchor(top: contentView.topAnchor , leading: iconImage.trailingAnchor , bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor , paddingTop: 4, paddingLeft: 8, paddingBottom: 4, paddingRight: 4 )
        
        iconImage.anchor(leading: contentView.leadingAnchor , centerY: contentView.centerYAnchor , width: 25 , height: 25)
        
        
        stackView.anchor(top: titleLabel.bottomAnchor , leading: contentView.leadingAnchor , bottom: contentView.bottomAnchor , trailing: contentView.trailingAnchor , paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8 )

    }
    
    func setTitle (title : String? , icon : String?) {
        if title == SString.logout {
            titleLabel.textColor = Colors.colorlogoutRed
        }else {
            titleLabel.textColor = Colors.colorText
        }
        titleLabel.text = title
        iconImage.image = UIImage(named: icon ?? "")
        titleLabel.isHidden = false
        iconImage.isHidden = false
        checkoutButton.isHidden = true
        checkInButton.isHidden = true
        heightStack?.constant = 0
    }
    
    func showButtons () {
        checkoutButton.isHidden = false
        checkInButton.isHidden = false
        heightStack?.constant = 40
        
        titleLabel.isHidden = true
        iconImage.isHidden = true
    }
    
    @objc private func actionChechin () {
        delegateCell?.actionCheckin()
    }
    
    @objc private func actionCheckout () {
        delegateCell?.actionCheckout()
    }
    
}

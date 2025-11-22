//
//  ExpandableView.swift
//  LibraryProject
//
//  Created by yusef naser on 14/11/2025.
//

import UIKit

class ExpandableView: UIView {
    
    private let titleLabel : LLabel = {
        let l = LLabel(isBold: false , fontSize: .size_18)
        l.textColor = Colors.colorTitleDetials
        return l
    }()
    //private let arrowImageView = UIImageView()
    private let containerView = UIView()   // <-- your custom content view goes here

    private var isExpanded = false
    private var containerHeightConstraint: NSLayoutConstraint!

    init(title: String, contentView: UIView) {
        super.init(frame: .zero)
        setupUI(title: title, contentView: contentView)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    private func setupUI(title: String, contentView: UIView) {
        backgroundColor = .white
        layer.cornerRadius = 12
        layer.masksToBounds = true
        
        // Title label
        titleLabel.text = title
        
        // Arrow
      //  arrowImageView.image = UIImage(systemName: "chevron.down")
      //  arrowImageView.tintColor = .gray
        
        // Container for custom content
        containerView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add subviews
        addSubview(titleLabel)
        //addSubview(arrowImageView)
        addSubview(containerView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        //arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Title
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            // Arrow
//            arrowImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
//            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            // Container View (holds custom view)
            containerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

            // ContentView fills inside container
            contentView.topAnchor.constraint(equalTo: containerView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
        
        // Start Collapsed
//        containerHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: 0)
//        containerHeightConstraint.isActive = true
        
        // Tap gesture
       // addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toggle)))
    }

    @objc private func toggle() {
        isExpanded.toggle()
        
        // Arrow animation
//        UIView.animate(withDuration: 0.25) {
//            self.arrowImageView.transform = self.isExpanded
//                ? CGAffineTransform(rotationAngle: .pi)
//                : .identity
//        }

        // Collapse / Expand
        if isExpanded {
            containerHeightConstraint.isActive = false
        } else {
            containerHeightConstraint.isActive = true
        }

        UIView.animate(withDuration: 0.3, animations: {
            self.superview?.layoutIfNeeded()
        })
    }
}


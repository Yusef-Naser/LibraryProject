//
//  OnBoardingView.swift
//  LibraryProject
//
//  Created by yusef naser on 27/11/2025.
//

import UIKit

class OnBoardingView : UIView , UIScrollViewDelegate{
    
    private let topSafeArea = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0

    
    private let onboardingData: [OnboardingPageView] = [
        OnboardingPageView(image: "onboard1", title: SString.onboard1),
        OnboardingPageView(image: "onboard2", title: SString.onboard2),
        OnboardingPageView(image: "onboard3", title: SString.onboard3)
    ]
    
    private let backgroundImage  : UIImageView = {
        let l = UIImageView()
        l.contentMode = .scaleAspectFill
        l.clipsToBounds = true
        l.image = UIImage(named: "background")
        return l
    }()
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isPagingEnabled = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.delegate = self
        scroll.addSubview(self.contentView)
        self.contentView.anchor(top: scroll.topAnchor, leading: scroll.leadingAnchor, bottom: scroll.bottomAnchor, trailing: scroll.trailingAnchor)
        self.contentView.heightAnchor.constraint(equalTo: scroll.heightAnchor, multiplier: 1).isActive = true
        scroll.showsVerticalScrollIndicator = false
        scroll.semanticContentAttribute = .forceLeftToRight
        return scroll
    }()
    
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    
    
    let viewPage : ViewPage = {
        let l = ViewPage()
        return l
    }()
    
    let buttonLogin : LButton = {
        let l = LButton()
        l.setTitle(SString.next, for: .normal)
        return l
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
        self.backgroundColor = .white
        addConstraints()
    }
    
    func addConstraints () {
        self.addSubview(backgroundImage)
        self.addSubview(scrollView)
        self.addSubview(viewPage)
        self.addSubview(buttonLogin)
        
        backgroundImage.anchor(top: topAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor)
        
        viewPage.anchor(top: self.topAnchor , leading: leadingAnchor , trailing: trailingAnchor , paddingTop: (topSafeArea) + 10 , paddingLeft: 8 , paddingRight: 8)
        scrollView.anchor(top: viewPage.bottomAnchor , leading: leadingAnchor , bottom: buttonLogin.topAnchor , trailing: trailingAnchor , paddingTop: 8)
        
        buttonLogin.anchor(leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor ,paddingLeft: 16 , paddingBottom: 50 , paddingRight: 16, height: 50)
      
        
        let page1 = onboardingData[0]
       // page1.backgroundColor = .brown
        contentView.addSubview(page1)
        page1.anchor(top: contentView.topAnchor , leading: contentView.leadingAnchor , bottom: contentView.bottomAnchor)
        page1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
        
        let page2 = onboardingData[1]
       // page2.backgroundColor = .green
        contentView.addSubview(page2)
        page2.anchor(top: contentView.topAnchor , leading: page1.trailingAnchor , bottom: contentView.bottomAnchor)
        page2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
        
        let page3 = onboardingData[2]
     //   page3.backgroundColor = .orange
        contentView.addSubview(page3)
        page3.anchor(top: contentView.topAnchor , leading: page2.trailingAnchor , bottom: contentView.bottomAnchor , trailing: contentView.trailingAnchor)
        page3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
        
    }

    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Calculate the current page index based on the scroll position
        let pageIndex = round(scrollView.contentOffset.x / self.bounds.width)
        viewPage.setPage(page: Int(pageIndex) )
        if pageIndex == 2 {
            buttonLogin.setTitle(SString.finish , for: .normal)
        }else {
            buttonLogin.setTitle(SString.next , for: .normal)
        }
        
    }
}


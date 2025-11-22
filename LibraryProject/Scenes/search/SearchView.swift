//
//  SearchView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 22/01/2022.
//VC

import UIKit

class SearchView : UIView {
    
    let topSafeArea = UIApplication.shared.keyWindow?.safeAreaInsets.top
    var topTableViewConstraint_stackViewSearch : NSLayoutConstraint?
    var topTableViewConstraint_viewSelectedTag : NSLayoutConstraint?
    
    
    
    let backButton : BackButton = {
        let l = BackButton()
        return l
    }()
    
    lazy var searchItem : SearchItemView = {
        let l = SearchItemView()
        return l
    }()
    
//    let filterView : FilterView = {
//        let l = FilterView()
//        l.isUserInteractionEnabled = true
//        return l
//    }()
    let filterIcon : UIButton = {
        let l = UIButton()
        l.setImage(UIImage(named: "filter"), for: .normal)
        return l
    }()
    
    private lazy var viewContainFilter : UIView = {
        let l = UIView()
        l.addSubview(filterIcon)
        
        filterIcon.anchor(centerX: l.centerXAnchor , centerY: l.centerYAnchor , width: 24 , height: 24)
        
        l.translatesAutoresizingMaskIntoConstraints = false
        l.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        return l
    }()
    
    private lazy var stackViewSearch : UIStackView = {
        let l = UIStackView()
        l.axis = .horizontal
        l.spacing = 10
        
        l.addArrangedSubview(searchItem)
        l.addArrangedSubview(viewContainFilter)
        
        return l
    }()
    
    let tableView : UITableView = {
        let l = UITableView()
        l.tableFooterView = UIView()
        l.register(FavoriteCell.self , forCellReuseIdentifier: FavoriteCell.getIdentifier() )
        l.separatorStyle = .none
        return l
    }()
    
    private let labelSelectedTag : LLabel = {
        let l = LLabel()
        l.textColor = Colors.colorPrimary
        return l
    }()
    
    let buttonDeleteTag : UIButton = {
        let l = UIButton()
        l.setImage(UIImage(named: "close"), for: .normal)
        
        return l
    }()
    
    private lazy var viewSelectedTag : UIView = {
        let l = UIView()
        l.backgroundColor = Colors.colorbackgroundDetails
        l.layer.cornerRadius = 10
        l.clipsToBounds = true
        
        l.addSubview(labelSelectedTag)
        l.addSubview(buttonDeleteTag)
        
        buttonDeleteTag.anchor(top: l.topAnchor , bottom: l.bottomAnchor , trailing: l.trailingAnchor)
        labelSelectedTag.anchor(top: l.topAnchor , leading: l.leadingAnchor , bottom: l.bottomAnchor , trailing: buttonDeleteTag.leadingAnchor , paddingTop: 8 , paddingLeft: 16 , paddingBottom: 8 , paddingRight: 16)
        
        l.isHidden = true
        
        return l
    }()
    
//    let collectionView : UICollectionView = {
//        let layout = ResizingFlowLayout(insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
//        layout.height = 250
//        
//        let l = UICollectionView(frame: .zero , collectionViewLayout: layout)
//        l.backgroundColor = .white
//        l.register(CellBook.self , forCellWithReuseIdentifier: CellBook.getIdentifier())
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
    }
    
    private func addViews () {
        addSubview(backButton)
        addSubview(stackViewSearch)
        addSubview(tableView)
        addSubview(viewSelectedTag)
        
        backButton.anchor( leading: leadingAnchor , centerY: stackViewSearch.centerYAnchor , paddingLeft: 16 )
        stackViewSearch.anchor(top: topAnchor , leading: backButton.trailingAnchor , trailing: trailingAnchor , paddingTop: (topSafeArea ?? 0) + 16, paddingLeft: 16 , paddingRight: 16 , height: 50 )
        
        viewSelectedTag.anchor(top: stackViewSearch.bottomAnchor , centerX: stackViewSearch.centerXAnchor , paddingTop: 8)
        
        tableView.anchor( leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor , paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8 )
        
        topTableViewConstraint_stackViewSearch = tableView.topAnchor.constraint(equalTo: stackViewSearch.bottomAnchor)
        topTableViewConstraint_stackViewSearch?.priority = .defaultLow
        topTableViewConstraint_stackViewSearch?.isActive = true
        
        topTableViewConstraint_viewSelectedTag = tableView.topAnchor.constraint(equalTo: viewSelectedTag.bottomAnchor)
        topTableViewConstraint_viewSelectedTag?.priority = .defaultHigh
        topTableViewConstraint_viewSelectedTag?.isActive = false
        
        
    }
    
    
    func setDelegates (delegate : SearchVC?) {
        tableView.delegate = delegate
        tableView.dataSource = delegate
        searchItem.textField.delegate = delegate
    }
    
    func setSearchBlink (blink : String?) {
        guard let blink = blink else {
            return
        }
        searchItem.textField.text = blink
        
    }
    
    func addPickerView () {
        
        
//        addSubview(filterView.pickerViewFilter)
//        addSubview(filterView.toolbar)
//        
//        filterView.pickerViewFilter.anchor( leading: leadingAnchor , bottom: self.bottomAnchor , trailing: trailingAnchor , paddingLeft: 0, paddingBottom: 0, paddingRight: 0 )
//        
//        filterView.toolbar.anchor( leading: leadingAnchor , bottom: filterView.pickerViewFilter.topAnchor , trailing: trailingAnchor , height: 50 )
        
        
    }
    
    func removePickerView () {
//        filterView.pickerViewFilter.removeFromSuperview()
//        filterView.toolbar.removeFromSuperview()
    }
    
    func selectFilter(filter : String?){
        guard let filter = filter , filter.count > 0 else {
            viewSelectedTag.isHidden = true
            topTableViewConstraint_viewSelectedTag?.isActive = false
            return
        }
        topTableViewConstraint_viewSelectedTag?.isActive = true
        viewSelectedTag.isHidden = false
        labelSelectedTag.text = filter
    }
    
    func deleteSelectedTag () {
        viewSelectedTag.isHidden = true
        topTableViewConstraint_viewSelectedTag?.isActive = false
    }
}

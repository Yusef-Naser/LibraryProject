//
//  SectionBooksView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//

import UIKit

protocol SectionBooksViewDelegate : AnyObject {
    func clickOnBook (item : ModelLatest?)
    func clickOnBook (item : ModelSuggestedBook?)
}

class SectionBooksView : UIView {
    
    weak var delegateView : SectionBooksViewDelegate?
    
    var arrayItems : [ModelLatest] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var arraySuggested : [ModelSuggestedBook] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private let labelTitle : LLabel = {
        let l = LLabel(isBold: true , fontSize: .size_20)
        return l
    }()
    
    private let buttonViewAll : UIButton = {
        let l = UIButton()
        l.setTitle(SString.viewAll , for: .normal)
        l.setTitleColor( UIColor.gray , for: .normal)
        l.isHidden = true
        l.titleLabel?.font = UIFont.regular(size: .size_16)
        return l
    }()
    
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let l = UICollectionView(frame: .zero , collectionViewLayout: layout)
        l.backgroundColor = .clear
        l.register(CellBook.self , forCellWithReuseIdentifier: CellBook.getIdentifier())
        
        return l
    }()
    
    init(title : String) {
        super.init(frame: .zero)
        initViews()
        self.labelTitle.text = title
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
        collectionView.delegate = self
        collectionView.dataSource = self
        self.backgroundColor = .clear
    }
    
    private func addViews () {
        
        addSubview(labelTitle)
        addSubview(buttonViewAll)
        addSubview(collectionView)
        
        labelTitle.anchor(top: topAnchor , leading: leadingAnchor , paddingTop: 16  )
        buttonViewAll.anchor( trailing: trailingAnchor , centerY: labelTitle.centerYAnchor , paddingRight: 16 )
        collectionView.anchor(top: buttonViewAll.bottomAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor , paddingTop: 8, paddingBottom: 8, height: 250 )
        
        
    }
    
}

extension SectionBooksView : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout , CellBookDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.width / 2 ) - 5 , height: collectionView.frame.height - 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  (arrayItems.count != 0) ? arrayItems.count : arraySuggested.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellBook.getIdentifier() , for: indexPath ) as! CellBook
        if arrayItems.count > 0 {
            let item = arrayItems[indexPath.row]
            cell.setTitle(title: item.title)
            cell.setImage(image: item.image)
            cell.delegateCell = self
            
            let favorites = SharedData.instance.getFavorites()
            if favorites.contains(where: { itemFavorite in
                itemFavorite.id == item.biblionumber
            }) {
                cell.buttonFavorite.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
            }else {
                cell.buttonFavorite.setImage(#imageLiteral(resourceName: "unfavorite"), for: .normal)
            }
            
        }else {
            let item = arraySuggested[indexPath.row]
            cell.setTitle(title: item.title)
            cell.setImage(image: item.imageFullURL)
            cell.delegateCell = self
            
            let favorites = SharedData.instance.getFavorites()
            if favorites.contains(where: { itemFavorite in
                itemFavorite.id == Int(item.biblionumber ?? "0")
            }) {
                cell.buttonFavorite.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
            }else {
                cell.buttonFavorite.setImage(#imageLiteral(resourceName: "unfavorite"), for: .normal)
            }
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if arrayItems.count > 0 {
            delegateView?.clickOnBook(item: arrayItems[indexPath.row])
        }else if arraySuggested.count > 0 {
            delegateView?.clickOnBook(item: arraySuggested[indexPath.row])
        }
        
    }
    
    
    func actionFavorite(cell: CellBook) {
        guard let index = collectionView.indexPath(for: cell ) else {
            return
        }
        if cell.buttonFavorite.imageView?.image == #imageLiteral(resourceName: "unfavorite") {
            cell.buttonFavorite.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
            
            if arrayItems.count > 0 {
                SharedData.instance.setFavorite(favorite: ModelFavorite.getModelFavorite(book: arrayItems[index.row]))
            }else if arraySuggested.count > 0 {
                SharedData.instance.setFavorite(favorite: ModelFavorite.getModelFavorite(book: arraySuggested[index.row]))
            }
            
        }else {
            cell.buttonFavorite.setImage( #imageLiteral(resourceName: "unfavorite") , for: .normal)
            if arrayItems.count > 0 {
                SharedData.instance.removeFavorite(id: arrayItems[index.row].biblionumber ?? 0)
            }else if arraySuggested.count > 0 {
                SharedData.instance.removeFavorite(id: Int(arraySuggested[index.row].biblionumber ?? "0") ?? 0)
            }
            
        }
    }
}

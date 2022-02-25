//
//  SectionBooksView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//

import UIKit

protocol SectionBooksViewDelegate : AnyObject {
    func clickOnBook (item : ModelLatest?)
}

class SectionBooksView : UIView {
    
    weak var delegateView : SectionBooksViewDelegate?
    
    var arrayItems : [ModelLatest] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private let labelTitle : UILabel = {
        let l = UILabel()
        l.font = UIFont.boldSystemFont(ofSize: 20)
        return l
    }()
    
    private let buttonViewAll : UIButton = {
        let l = UIButton()
        l.setTitle(SString.viewAll , for: .normal)
        l.setTitleColor( UIColor.gray , for: .normal)
        return l
    }()
    
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let l = UICollectionView(frame: .zero , collectionViewLayout: layout)
        l.backgroundColor = .white
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
    }
    
    private func addViews () {
        
        addSubview(labelTitle)
        addSubview(buttonViewAll)
        addSubview(collectionView)
        
        labelTitle.anchor(top: topAnchor , leading: leadingAnchor , paddingTop: 16 , paddingLeft: 16 )
        buttonViewAll.anchor( trailing: trailingAnchor , centerY: labelTitle.centerYAnchor , paddingRight: 16 )
        collectionView.anchor(top: buttonViewAll.bottomAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor , paddingTop: 8, paddingLeft: 16, paddingBottom: 8, paddingRight: 16 , height: 250 )
        
        
    }
    
}

extension SectionBooksView : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout , CellBookDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.width / 2 ) - 5 , height: collectionView.frame.height - 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellBook.getIdentifier() , for: indexPath ) as! CellBook
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
            cell.buttonFavorite.setImage(#imageLiteral(resourceName: "Path 37"), for: .normal)
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegateView?.clickOnBook(item: arrayItems[indexPath.row])
    }
    
    
    func actionFavorite(cell: CellBook) {
        guard let index = collectionView.indexPath(for: cell ) else {
            return
        }
        if cell.buttonFavorite.imageView?.image == #imageLiteral(resourceName: "Path 37") {
            cell.buttonFavorite.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
            SharedData.instance.setFavorite(favorite: ModelFavorite.getModelFavorite(book: arrayItems[index.row]))
        }else {
            cell.buttonFavorite.setImage( #imageLiteral(resourceName: "Path 37") , for: .normal)
            SharedData.instance.removeFavorite(id: arrayItems[index.row].biblionumber ?? 0)
        }
    }
}

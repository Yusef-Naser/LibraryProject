//
//  FavoritesVC.swift
//  LibraryProject
//
//  Created by Yusef Naser on 25/02/2022.
//

import UIKit

class FavoritesVC : BaseVC<FavoritesView> {
    
    private var presenter : ProFavoritesPresetner?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        presenter = FavoritesPresenter(view : self )
        mainView.setDelegates(delegate: self )
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.getFavorites()
    }
    
}

extension FavoritesVC : ProFavoritesView , NavigationBarDelegate{
    func fetchData() {
        mainView.collectionView.reloadData()
    }
    
    func navigationDismissView() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension FavoritesVC : UICollectionViewDelegate , UICollectionViewDataSource , CellBookDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.getDataCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellBook.getIdentifier() , for: indexPath ) as! CellBook
        cell.setTitle(title: presenter?.getItem(index: indexPath.row)?.title)
        let icon = "https://library.awresidence.com/cgi-bin/koha/opac-image.pl?biblionumber="
        cell.setImage(image: icon + "\(presenter?.getItem(index: indexPath.row)?.id ?? 0)")
        
        cell.delegateCell = self
        
        let favorites = SharedData.instance.getFavorites()
        if favorites.contains(where: { itemFavorite in
            itemFavorite.id == Int(presenter?.getItem(index: indexPath.row)?.id ?? 0)
        }) {
            cell.buttonFavorite.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
        }else {
            cell.buttonFavorite.setImage(#imageLiteral(resourceName: "Path 37"), for: .normal)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = presenter?.getItem(index: indexPath.row)
        let icon = "https://library.awresidence.com/cgi-bin/koha/opac-image.pl?biblionumber="
        self.navigationController?.pushViewController(DetailBookVC(bookItem: ModelLatest(biblionumber: item?.id  ?? 0, title: item?.title, image: icon + "\(presenter?.getItem(index: indexPath.row)?.id ?? 0)" )), animated: true )
    }
    
    func actionFavorite(cell: CellBook) {
        
        guard let index = mainView.collectionView.indexPath(for: cell ) else {
            return
        }
        let id = presenter?.getItem(index: index.row)?.id
        let title = presenter?.getItem(index: index.row)?.title
        if cell.buttonFavorite.imageView?.image == #imageLiteral(resourceName: "Path 37") {
            cell.buttonFavorite.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
            SharedData.instance.setFavorite(favorite: ModelFavorite.getModelFavorite(book: ModelLatest(biblionumber: Int(id ?? 0), title: title , image: "")))
        }else {
            cell.buttonFavorite.setImage( #imageLiteral(resourceName: "Path 37") , for: .normal)
            SharedData.instance.removeFavorite(id: Int(id ?? 0 ))
        }
    }
    
}

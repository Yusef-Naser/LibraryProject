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

extension FavoritesVC : ProFavoritesView {
    func fetchData() {
        mainView.tableView.reloadData()
    }
}

extension FavoritesVC : UITableViewDelegate , UITableViewDataSource , FavoriteCellDelegate {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        presenter?.getDataCount() ?? 0
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteCell.getIdentifier() , for: indexPath ) as! FavoriteCell
//        cell.setTitle(title: presenter?.getItem(index: indexPath.row)?.title)
//        let icon = "https://library.awresidence.com/cgi-bin/koha/opac-image.pl?biblionumber="
//        cell.setImage(image: icon + "\(presenter?.getItem(index: indexPath.row)?.id ?? 0)")
//        
//        cell.delegateCell = self
//        
//        let favorites = SharedData.instance.getFavorites()
//        if favorites.contains(where: { itemFavorite in
//            itemFavorite.id == Int(presenter?.getItem(index: indexPath.row)?.id ?? 0)
//        }) {
//            cell.buttonFavorite.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
//        }else {
//            cell.buttonFavorite.setImage(#imageLiteral(resourceName: "unfavorite"), for: .normal)
//        }
//        
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let item = presenter?.getItem(index: indexPath.row)
//        let icon = "https://library.awresidence.com/cgi-bin/koha/opac-image.pl?biblionumber="
//        self.navigationController?.pushViewController(DetailBookVC(bookItem: ModelLatest(biblionumber: item?.id  ?? 0, title: item?.title, image: icon + "\(presenter?.getItem(index: indexPath.row)?.id ?? 0)" )), animated: true )
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = presenter?.getDataCount() ?? 0
        if count == 0 {
            tableView.backgroundView = EmptyView(text: SString.youHavenotMarkedAnyBookYet)
        }else {
            tableView.backgroundView = nil
        }
        return count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.getIdentifier(), for: indexPath) as! FavoriteCell
        cell.setTitle(title: presenter?.getItem(index: indexPath.row)?.title)
       // let icon = "https://library.awresidence.com/cgi-bin/koha/opac-image.pl?biblionumber="
        cell.setImage(image: presenter?.getItem(index: indexPath.row)?.image ?? "" )
        
        cell.delegateCell = self
        
        let favorites = SharedData.instance.getFavorites()
        if favorites.contains(where: { itemFavorite in
            itemFavorite.id == Int(presenter?.getItem(index: indexPath.row)?.id ?? 0)
        }) {
            cell.buttonFavorite.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
        }else {
            cell.buttonFavorite.setImage(#imageLiteral(resourceName: "unfavorite"), for: .normal)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = presenter?.getItem(index: indexPath.row)
//       let icon = "https://library.awresidence.com/cgi-bin/koha/opac-image.pl?biblionumber="
        self.navigationController?.pushViewController(DetailBookVC(bookItem: ModelLatest(biblionumber: item?.id  ?? 0, title: item?.title, image: "\(presenter?.getItem(index: indexPath.row)?.image ?? "0")" )), animated: true )
    }
    
    
    
    func actionFavorite(cell: FavoriteCell) {
        
        guard let index = mainView.tableView.indexPath(for: cell ) else {
            return
        }
        let id = presenter?.getItem(index: index.row)?.id
        let title = presenter?.getItem(index: index.row)?.title
        if cell.buttonFavorite.imageView?.image == #imageLiteral(resourceName: "unfavorite") {
            cell.buttonFavorite.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
            SharedData.instance.setFavorite(favorite: ModelFavorite.getModelFavorite(book: ModelLatest(biblionumber: Int(id ?? 0), title: title , image: "")))
        }else {
            cell.buttonFavorite.setImage( #imageLiteral(resourceName: "unfavorite") , for: .normal)
            SharedData.instance.removeFavorite(id: Int(id ?? 0 ))
        }
    }
    
}

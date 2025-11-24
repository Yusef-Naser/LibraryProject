//
//  ViewAllVC.swift
//  LibraryProject
//
//  Created by yusef naser on 23/11/2025.
//

import UIKit

class ViewAllVC : BaseVC<ViewAllView> {
    
    var books: [ModelFeaturedBook]? = nil
    
    init(books: [ModelFeaturedBook]?) {
        self.books = books
        super.init(nibName: nil , bundle: nil )
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.setDelegate(delegate: self)
        mainView.tableView.reloadData()
    }
    
}

extension ViewAllVC : NavigationBarDelegate {
    func navigationDismissView() {
        self.navigationController?.popViewController(animated: true )
    }
}

extension ViewAllVC : UITableViewDelegate , UITableViewDataSource , FavoriteCellDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.getIdentifier(), for: indexPath) as! FavoriteCell
        cell.setTitle(title: books?[indexPath.row].title)
       // let icon = "https://library.awresidence.com/cgi-bin/koha/opac-image.pl?biblionumber="
        cell.setImage(image: books?[indexPath.row].imageURL ?? "" )
        
        cell.delegateCell = self
        
        let favorites = SharedData.instance.getFavorites()
        if favorites.contains(where: { itemFavorite in
            itemFavorite.id == Int(books?[indexPath.row].id ?? 0)
        }) {
            cell.buttonFavorite.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
        }else {
            cell.buttonFavorite.setImage(#imageLiteral(resourceName: "unfavorite"), for: .normal)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = books?[indexPath.row]
//       let icon = "https://library.awresidence.com/cgi-bin/koha/opac-image.pl?biblionumber="
        self.navigationController?.pushViewController(DetailBookVC(bookItem: ModelLatest(biblionumber: item?.id  ?? 0, title: item?.title, image: "\(item?.imageURL ?? "0")" )), animated: true )
    }
    
    
    
    func actionFavorite(cell: FavoriteCell) {
        
        guard let index = mainView.tableView.indexPath(for: cell ) else {
            return
        }
        let item = books?[index.row]
        let id = item?.id
        let title = item?.title
        if cell.buttonFavorite.imageView?.image == #imageLiteral(resourceName: "unfavorite") {
            cell.buttonFavorite.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
            SharedData.instance.setFavorite(favorite: ModelFavorite.getModelFavorite(book: ModelLatest(biblionumber: Int(id ?? 0), title: title , image: item?.imageURL ?? "")))
        }else {
            cell.buttonFavorite.setImage( #imageLiteral(resourceName: "unfavorite") , for: .normal)
            SharedData.instance.removeFavorite(id: Int(id ?? 0 ))
        }
    }
    
    
}

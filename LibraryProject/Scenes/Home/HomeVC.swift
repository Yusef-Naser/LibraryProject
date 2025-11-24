//
//  HomeVC.swift
//  Library
//
//  Created by yusef naser on 18/01/2022.
//

import UIKit

class HomeVC : BaseVC<HomeView> {
    
    private var presenter : ProHomePresetner?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        presenter = HomePresenter(view : self )
        mainView.setDelegates(delegate: self ) // collectionview and SectionBooksViewDelegate
        mainView.searchView.addGestureRecognizer(UITapGestureRecognizer(target: self , action: #selector(actionSearch)))
        mainView.buttonViewAll.addTarget(self , action: #selector(actionViewAll), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.viewWillAppear()
    }
    
    @objc private func actionSearch () {
        parentNavigationController?.pushViewController(SearchVC(blink: nil ) , animated: true )
    }
    
    @objc private func actionViewAll () {
        parentNavigationController?.pushViewController(ViewAllVC(books: self.presenter?.modelfeatured?.data?.books) , animated: true )
    }
    
}

extension HomeVC : ProHomeView {
    
    func getListNewBooks(list: [ModelLatest]) {
        mainView.sectionNewBooks.arrayItems = list
    }
    
    func getListFeatureBooks(list: [ModelFeaturedBook]) {
        mainView.tableFeaturedBooks.reloadData()
    }
    
    func getSuggestedBooks(list: [ModelSuggestedBook]) {
        mainView.sectionSeggestedBooks.arraySuggested = list
    }
    
}

extension HomeVC : SectionBooksViewDelegate {
    
    func clickOnBook(item: ModelLatest?) {
        self.navigationController?.pushViewController(DetailBookVC(bookItem: item ), animated: true )
    }
    
    func clickOnBook(item: ModelSuggestedBook?) {
        self.navigationController?.pushViewController(DetailBookVC(bookItem: item ), animated: true )
    }
}

extension HomeVC : UITableViewDelegate , UITableViewDataSource , FavoriteCellDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.getIdentifier(), for: indexPath) as! FavoriteCell
        cell.setTitle(title: presenter?.getFeaturedItem(index: indexPath.row)?.title)
       // let icon = "https://library.awresidence.com/cgi-bin/koha/opac-image.pl?biblionumber="
        cell.setImage(image: presenter?.getFeaturedItem(index: indexPath.row)?.imageURL ?? "" )
        
        cell.delegateCell = self
        
        let favorites = SharedData.instance.getFavorites()
        if favorites.contains(where: { itemFavorite in
            itemFavorite.id == Int(presenter?.getFeaturedItem(index: indexPath.row)?.id ?? 0)
        }) {
            cell.buttonFavorite.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
        }else {
            cell.buttonFavorite.setImage(#imageLiteral(resourceName: "unfavorite"), for: .normal)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = presenter?.getFeaturedItem(index: indexPath.row)
//       let icon = "https://library.awresidence.com/cgi-bin/koha/opac-image.pl?biblionumber="
        self.navigationController?.pushViewController(DetailBookVC(bookItem: ModelLatest(biblionumber: item?.id  ?? 0, title: item?.title, image: "\(item?.imageURL ?? "0")" )), animated: true )
    }
    
    
    
    func actionFavorite(cell: FavoriteCell) {
        
        guard let index = mainView.tableFeaturedBooks.indexPath(for: cell ) else {
            return
        }
        let item = presenter?.getFeaturedItem(index: index.row)
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

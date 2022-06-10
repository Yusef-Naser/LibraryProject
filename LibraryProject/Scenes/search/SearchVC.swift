//
//  SearchVC.swift
//  LibraryProject
//
//  Created by Yusef Naser on 22/01/2022.
//

import UIKit

class SearchVC : BaseVC<SearchView> {
    
    private var presenter : ProSearchPresetner?
    
    private var blink : String?
    
    init (blink : String?) {
        super.init(nibName: nil , bundle: nil )
        self.blink = blink
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        presenter = SearchPresenter(view : self )
        mainView.setDelegates(delegate: self )
        
        mainView.searchItem.textField.addTarget(self , action: #selector(actionTextField), for: .editingDidBegin)
        
        if let blink = blink {
            mainView.setSearchBlink(blink: blink)
            textFieldShouldReturn(mainView.searchItem.textField)
        }
        mainView.filterView.addGestureRecognizer(UITapGestureRecognizer(target: self , action: #selector(actionFilter)))
        
        presenter?.selectedFilter = mainView.filterView.arrayFilter[0]
        mainView.filterView.completionSelectPicker = { string in
            self.presenter?.selectedFilter = string
        }
        
    }
    
    @objc private func actionFilter () {
        mainView.endEditing(true )
        mainView.addPickerView()
    }
    
    @objc private func actionTextField () {
        mainView.removePickerView()
    }
    
}

extension SearchVC : ProSearchView , NavigationBarDelegate {
    func fetchData() {
        mainView.collectionView.reloadData()
    }
    
    func navigationDismissView() {
        self.navigationController?.popViewController(animated: true )
    }
}

extension SearchVC : UICollectionViewDelegate , UICollectionViewDataSource , CellBookDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        presenter?.callPagination(index: indexPath.row )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.getDataCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellBook.getIdentifier() , for: indexPath ) as! CellBook
        let id = presenter?.getItem(index: indexPath.row)?.1
        
        cell.setTitle(title: presenter?.getItem(index: indexPath.row)?.0)
        let icon = "https://library.awresidence.com/cgi-bin/koha/opac-image.pl?biblionumber="
        cell.setImage(image: icon + "\(presenter?.getItem(index: indexPath.row)?.1 ?? "")")
        cell.delegateCell = self
        
        let favorites = SharedData.instance.getFavorites()
        if favorites.contains(where: { itemFavorite in
            itemFavorite.id == Int(id ?? "0")
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
        self.navigationController?.pushViewController(DetailBookVC(bookItem: ModelLatest(biblionumber: Int(item?.1 ?? "0") ?? 0, title: item?.0, image: icon + "\(presenter?.getItem(index: indexPath.row)?.1 ?? "")" )), animated: true )
    }
    
    func actionFavorite(cell: CellBook) {
        
        guard let index = mainView.collectionView.indexPath(for: cell ) else {
            return
        }
        let id = presenter?.getItem(index: index.row)?.1
        let title = presenter?.getItem(index: index.row)?.0
        if cell.buttonFavorite.imageView?.image == #imageLiteral(resourceName: "Path 37") {
            cell.buttonFavorite.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
            SharedData.instance.setFavorite(favorite: ModelFavorite.getModelFavorite(book: ModelLatest(biblionumber: Int(id ?? "0"), title: title , image: "")))
        }else {
            cell.buttonFavorite.setImage( #imageLiteral(resourceName: "Path 37") , for: .normal)
            SharedData.instance.removeFavorite(id: Int(id ?? "0" ) ?? 0)
        }
    }
    
}

extension SearchVC : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.mainView.endEditing(true )
        self.presenter?.getSearch(text: textField.text ?? "")
        return true
    }
    
}

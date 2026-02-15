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
      //  mainView.filterView.addGestureRecognizer(UITapGestureRecognizer(target: self , action: #selector(actionFilter)))
        mainView.backButton.addTarget(self , action: #selector(dismissViewController), for: .touchUpInside)
        mainView.filterIcon.addTarget(self , action: #selector(actionFilter ), for: .touchUpInside)
        mainView.buttonDeleteTag.addTarget(self , action: #selector(actionDeleteTag), for: .touchUpInside)
        presenter?.selectedFilter = ""
//        mainView.filterView.completionSelectPicker = { string in
//            self.presenter?.setSelectedFilter(filter: string )
//        }
        if let blink = blink {
            mainView.setSearchBlink(blink: blink)
            textFieldShouldReturn(mainView.searchItem.textField)
        }
        
    }
    
    @objc private func actionFilter () {
        mainView.endEditing(true )
//        mainView.addPickerView()
        let vc = FilterVC()
        vc.completionSelect = { text in
            self.presenter?.setSelectedFilter(filter: text )
            self.mainView.selectFilter(filter: text)
        }
        self.present( vc , animated: true )
    }
    
    @objc private func actionTextField () {
        mainView.removePickerView()
    }
    
    @objc private func dismissViewController() {
        self.navigationController?.popViewController(animated: true )
    }
    
    @objc private func actionDeleteTag () {
        self.presenter?.deleteSelectedFilter()
        self.mainView.deleteSelectedTag()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
}

extension SearchVC : ProSearchView {
    func fetchData() {
        mainView.tableView.reloadData()
    }
}

extension SearchVC : UITableViewDelegate , UITableViewDataSource , FavoriteCellDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        presenter?.callPagination(index: indexPath.row )
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView = nil
        let count = presenter?.getDataCount() ?? 0
        if count == 0 {
            tableView.backgroundView = EmptyView(text: SString.noResultsFoundTryAnotherKeyboards )
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.getIdentifier(), for: indexPath) as! FavoriteCell
        let id = presenter?.getItem(index: indexPath.row)?.recordNumber
        
        cell.setTitle(title: presenter?.getItem(index: indexPath.row)?.title)
        //let icon = "https://library.awresidence.com/cgi-bin/koha/opac-image.pl?biblionumber="
        let icon = BASEIMAGEURL("\(presenter?.getItem(index: indexPath.row)?.recordNumber ?? "")")
        cell.setImage(image: icon )
        cell.delegateCell = self
        
        let favorites = SharedData.instance.getFavorites()
        if favorites.contains(where: { itemFavorite in
            itemFavorite.id == Int(id ?? "0")
        }) {
            cell.buttonFavorite.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
        }else {
            cell.buttonFavorite.setImage(#imageLiteral(resourceName: "unfavorite"), for: .normal)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = presenter?.getItem(index: indexPath.row)
        let icon = BASEIMAGEURL("\(presenter?.getItem(index: indexPath.row)?.recordNumber ?? "")")
        self.navigationController?.pushViewController(DetailBookVC(bookItem: ModelLatest(biblionumber: Int(item?.recordNumber ?? "0") ?? 0, title: item?.title, image: icon )), animated: true )
    }
    
    func actionFavorite(cell: FavoriteCell) {
        guard let index = mainView.tableView.indexPath(for: cell ) else {
            return
        }
        let id = presenter?.getItem(index: index.row)?.recordNumber
        let title = presenter?.getItem(index: index.row)?.title
        if cell.buttonFavorite.imageView?.image == #imageLiteral(resourceName: "unfavorite") {
            cell.buttonFavorite.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
            SharedData.instance.setFavorite(favorite: ModelFavorite.getModelFavorite(book: ModelLatest(biblionumber: Int(id ?? "0"), title: title , image: BASEIMAGEURL(id ?? ""))))
        }else {
            cell.buttonFavorite.setImage( #imageLiteral(resourceName: "unfavorite") , for: .normal)
            SharedData.instance.removeFavorite(id: Int(id ?? "0" ) ?? 0)
        }
    }
    
}
extension SearchVC : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.mainView.endEditing(true )
        self.presenter?.getSearch(text: textField.text ?? "")
        self.mainView.searchItem.disableBorder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.mainView.searchItem.enableBorder()
    }
    
}

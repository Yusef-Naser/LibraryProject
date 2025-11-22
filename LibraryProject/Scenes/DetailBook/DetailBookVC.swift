//
//  DetailBookVC.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//

import UIKit

class DetailBookVC : BaseVC<DetailBookView> {
    
    private var presenter : ProDetailBookPresetner?
    
    private var bookItem : ModelLatest? = nil
    
    
    init(bookItem : ModelLatest?) {
        super.init(nibName: nil , bundle: nil)
        self.bookItem = bookItem
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = DetailBookPresenter(view : self )
        mainView.delegate = self
        mainView.fitTableView.delegate = self
        mainView.fitTableView.dataSource = self
        mainView.imageBook.loadImage(url: bookItem?.image ?? "" )
        mainView.imageBookBackground.loadImage(url: bookItem?.image ?? "" )
        presenter?.getBookDetails(id: bookItem?.biblionumber ?? 0)
        presenter?.getItemsBook(id: bookItem?.biblionumber ?? 0)
        mainView.buttonAddHold.addTarget(self , action: #selector(actionAddHold), for: .touchUpInside)
        
        let favorites = SharedData.instance.getFavorites()
        if favorites.contains(where: { itemFavorite in
            itemFavorite.id == bookItem?.biblionumber
        }) {
            mainView.buttonFavorite.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
        }else {
            mainView.buttonFavorite.setImage(#imageLiteral(resourceName: "unfavorite"), for: .normal)
        }
        
        
    }
    
    @objc private func actionAddHold () {
        presenter?.addHold(id: bookItem?.biblionumber ?? 0)
    }
    
}

extension DetailBookVC : ProDetailBookView , DetailBookViewDelegate {
    func addHoldSuccess() {
        showMessage("success")
    }
  
    func fetchItemBooks() {
        mainView.fitTableView.reloadData()
    }
    
    func dismiss() {
        self.navigationController?.popViewController(animated: true )
    }
    
    func favorite() {
        guard let bookItem = bookItem else {
            return
        }
        if mainView.buttonFavorite.imageView?.image == UIImage(named: "unfavorite") {
            mainView.buttonFavorite.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
            SharedData.instance.setFavorite(favorite: ModelFavorite.getModelFavorite(book: bookItem ))
        }else {
            mainView.buttonFavorite.setImage(#imageLiteral(resourceName: "unfavorite"), for: .normal)
            SharedData.instance.removeFavorite(id: bookItem.biblionumber ?? 0)
        }
    }
    
    func fetchData() {
        presenter?.setConfigurationView(view: mainView)
    }
    
    func fetchLibraryName(index: Int, name: String?) {
        guard let cell = mainView.fitTableView.cellForRow(at: IndexPath(row: index , section: 0)) as? CellItemBook else {
            return
        }
        presenter?.modelItemsBook?[index].libraryName = name
        let item = presenter?.modelItemsBook?[index]
        let callumber = item?.callnumber ?? ""
        let itemType = item?.itemTypeID ?? ""
        let externalID = item?.externalID ?? ""
        let stack = item?.stack ?? ""

        let text = (name ?? "" ) + " - " + stack + "- " + externalID + "-" + callumber + " - " + itemType
        cell.setTitle(title: text)
        mainView.fitTableView.reloadData()

    }
}

extension DetailBookVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.modelItemsBook?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellItemBook.getIdentifier() , for: indexPath) as! CellItemBook
        
        let item = presenter?.modelItemsBook?[indexPath.row]
        let libraryName = item?.libraryName ?? ""
        let callumber = item?.callnumber ?? ""
        let externalID = item?.externalID ?? ""
        let stack = item?.stack ?? ""

        let itemType = item?.itemTypeID ?? ""
        let text = SString.library + " : " + libraryName + "\n" +  SString.barcode + " : " + externalID + "\n" + SString.callNumber + " : " + callumber + "\n" + SString.ShelvingControlNumber + " : " + stack + "\n" + SString.itemType + " : " + itemType ;
        
        cell.setTitle(title: text )
        getLibraryNameByIndex(index: indexPath.row)
        
        return cell
    }
    
    func getLibraryNameByIndex (index : Int ) {
        presenter?.getLibraryName(index: index)
        
    }
    
}

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
        mainView.navigation.delegateNavigation = self
        mainView.fitTableView.delegate = self
        mainView.fitTableView.dataSource = self
        mainView.imageBook.loadImage(url: bookItem?.image ?? "" )
        presenter?.getBookDetails(id: bookItem?.biblionumber ?? 0)
        presenter?.getItemsBook(id: bookItem?.biblionumber ?? 0)
    }
    
    
}

extension DetailBookVC : ProDetailBookView , NavigationBarDelegate {
    
    func fetchItemBooks() {
        mainView.fitTableView.reloadData()
    }
    
    func navigationDismissView() {
        self.navigationController?.popViewController(animated: true )
    }
    
    func fetchData() {
        presenter?.setConfigurationView(view: mainView)
    }
}

extension DetailBookVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.modelItemsBook?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellItemBook.getIdentifier() , for: indexPath) as! CellItemBook
        cell.setTitle(title: presenter?.modelItemsBook?[indexPath.row].message)
        cell.setImage(image: presenter?.modelItemsBook?[indexPath.row].path )
        return cell
    }
    
}

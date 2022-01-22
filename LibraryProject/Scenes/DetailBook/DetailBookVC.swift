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
        mainView.imageBook.loadImage(url: bookItem?.image ?? "" )
        presenter?.getBookDetails(id: bookItem?.biblionumber ?? 0)
    }
    
    
}

extension DetailBookVC : ProDetailBookView , NavigationBarDelegate {
    func navigationDismissView() {
        self.navigationController?.popViewController(animated: true )
    }
    
    func fetchData() {
        presenter?.setConfigurationView(view: mainView)
    }
}

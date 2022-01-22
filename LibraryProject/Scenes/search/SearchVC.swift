//
//  SearchVC.swift
//  LibraryProject
//
//  Created by Yusef Naser on 22/01/2022.
//

import UIKit

class SearchVC : BaseVC<SearchView> {
    
    private var presenter : ProSearchPresetner?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        presenter = SearchPresenter(view : self )
        mainView.setDelegates(delegate: self )
        
    }
    
    
}

extension SearchVC : ProSearchView , NavigationBarDelegate {
    func navigationDismissView() {
        self.navigationController?.popViewController(animated: true )
    }
}

extension SearchVC : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellBook.getIdentifier() , for: indexPath ) as! CellBook
        cell.setTitle(title: "title")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(DetailBookVC(bookItem: nil ), animated: true )
    }
    
}

extension SearchVC : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.mainView.endEditing(true )
        return true
    }
    
}

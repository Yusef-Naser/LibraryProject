//
//  SuggestionsVC.swift
//  LibraryProject
//
//  Created by Yusef Naser on 12/02/2022.
//

import UIKit

class SuggestionsVC : BaseVC<SuggestionsView> {
    
    private var presenter : ProSuggestionsPresetner?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        presenter = SuggestionsPresenter(view : self )
        mainView.setDelegate(delegate: self )
        
        mainView.buttonAddSuggest.addTarget(self , action: #selector(actionAddSuggest), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.getSuggestions()
    }
    
    @objc private func actionAddSuggest () {
        self.navigationController?.pushViewController(AddSuggestVC() , animated: true )
    }
    
    
}

extension SuggestionsVC : ProSuggestionsView , NavigationBarDelegate {
    func fetchSuggestions() {
        self.mainView.tableView.reloadData()
    }
    
    
    func navigationDismissView() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension SuggestionsVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.presenter?.suggestionCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellSuggest.getIdentifier() , for: indexPath) as! CellSuggest
        cell.setTitle(title: presenter?.getSuggest(index: indexPath.row)?.title)
        cell.setAuthor(author: presenter?.getSuggest(index: indexPath.row)?.author)
        cell.setLibrary(library: presenter?.getSuggest(index: indexPath.row)?.libraryID)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

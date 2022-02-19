//
//  AddSuggestVC.swift
//  LibraryProject
//
//  Created by Yusef Naser on 12/02/2022.
//

import UIKit

class AddSuggestVC : BaseVC<AddSuggestView> {
    
    private var presenter : ProAddSuggestPresetner?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        presenter = AddSuggestPresenter(view : self )
        mainView.navigation.delegateNavigation = self
        mainView.buttonSubmit.addTarget(self , action: #selector(actionSubmit), for: .touchUpInside)
    }
    
    
    @objc private func actionSubmit () {
        presenter?.addSuggest(title: mainView.textFieldTitle.text ?? "" ,
                              author: mainView.textFieldAuthor.text ?? "" ,
                              copyRightDate: mainView.textFieldCopyRightDate.text ?? "" ,
                              publisher: mainView.textFieldPublisher.text ?? "" ,
                              collectionTitle: mainView.textFieldCollectionTitle.text ?? "",
                              publicationPlace: mainView.textFieldPublicationPlace.text ?? "" ,
                              quantity: mainView.textFieldQuantity.text ?? "" ,
                              itemType: mainView.textFieldItemType.text ?? "" ,
                              library: mainView.textFieldLibrary.text ?? "" ,
                              notes: mainView.textFieldNotes.text ?? "")
    }
    
}

extension AddSuggestVC : ProAddSuggestView , NavigationBarDelegate {
    func navigationDismissView() {
        self.navigationController?.popViewController(animated: true )
    }
    
    func fetchData() {
        self.navigationController?.popViewController(animated: true )
    }
}

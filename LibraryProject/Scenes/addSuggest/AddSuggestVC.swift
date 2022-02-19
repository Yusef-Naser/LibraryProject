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
        presenter?.addSuggest(title: "title suggest")
    }
    
}

extension AddSuggestVC : ProAddSuggestView , NavigationBarDelegate {
    func navigationDismissView() {
        self.navigationController?.popViewController(animated: true )
    }
}

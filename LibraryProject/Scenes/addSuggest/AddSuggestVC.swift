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
        
        
    }
    
    
}

extension AddSuggestVC : ProAddSuggestView {
    
}

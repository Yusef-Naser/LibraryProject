//
//  DetailBookVC.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//

import UIKit

class DetailBookVC : BaseVC<DetailBookView> {
    
    private var presenter : ProDetailBookPresetner?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        presenter = DetailBookPresenter(view : self )
        
        
    }
    
    
}

extension DetailBookVC : ProDetailBookView {
    
}

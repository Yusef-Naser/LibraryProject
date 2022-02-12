//
//  CheckoutVC.swift
//  LibraryProject
//
//  Created by Yusef Naser on 09/02/2022.
//

import UIKit

class CheckoutVC : BaseVC<CheckoutView> {
    
    private var presenter : ProCheckoutPresetner?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        presenter = CheckoutPresenter(view : self )
        
        
    }
    
    
}

extension CheckoutVC : ProCheckoutView {
    
}

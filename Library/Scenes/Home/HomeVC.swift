//
//  HomeVC.swift
//  Library
//
//  Created by yusef naser on 18/01/2022.
//

import UIKit

class HomeVC : BaseVC<HomeView> {
    
    private var presenter : ProHomePresetner?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        presenter = HomePresenter(view : self )
        
        
    }
    
    
}

extension HomeVC : ProHomeView {
    
}

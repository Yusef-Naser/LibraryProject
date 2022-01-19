//
//  BaseVC.swift
//  Library
//
//  Created by yusef naser on 18/01/2022.
//

import UIKit

class BaseVC <T : UIView> : UIViewController , StatusApi  {
    
    func onError(_ message: String) {
        
    }
    
    func onFailure(_ message: String) {
        
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    var refreshController : UIRefreshControl?
    
    override func loadView() {
         let t = T()
         t.backgroundColor = .white
         self.view = t
     }
     var mainView : T {
       if let view = self.view as? T {
         return view
       }else {
         let view = T()
         self.view = view
         return view
      
       }
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
    
}

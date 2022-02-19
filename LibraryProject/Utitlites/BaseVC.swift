//
//  BaseVC.swift
//  Library
//
//  Created by yusef naser on 18/01/2022.
//

import UIKit

class BaseVC <T : UIView> : UIViewController , StatusApi  {
    
    func showMessage(_ message: String) {
        SnackBar.instance.setMessage(message)
    }
    
    func showLoading() {
        Loading.instance.hideLoading()
        Loading.instance.showLoading(view: self.mainView)
    }
    
    func hideLoading() {
        refreshController?.endRefreshing()
        Loading.instance.hideLoading()
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

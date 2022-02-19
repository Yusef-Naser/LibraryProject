//
//  Loading.swift
//  solutionplusUtilities
//
//  Created by yusef naser on 3/10/21.
//  Copyright © 2021 solutionPlus. All rights reserved.
//

import UIKit
import JGProgressHUD

open class Loading {
    
    public static let instance = Loading()
    
    private var progress = JGProgressHUD(style: .light)
    
    private init(){
        
    }
    
    public func showLoading(view : UIView) {
          hideLoading()
          progress.textLabel.text = nil
          progress.indicatorView = JGProgressHUDIndeterminateIndicatorView()
          //Indeterminate progress indicator
          progress.show(in: view)
      }
      
      public func hideLoading () {
          progress.dismiss()
      }
      
      public func showProgress (view : UIView ) {
             progress.show(in: view)
            // progress.textLabel.text = SString.uploading + "..."
             progress.indicatorView = JGProgressHUDRingIndicatorView()
         }
         
        public func setProgress ( value : Float ) {
            progress.progress = value
         }
    public func setTitle (title : String) {
        progress.textLabel.text = title
    }
    
}

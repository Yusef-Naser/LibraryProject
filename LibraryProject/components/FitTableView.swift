//
//  FitTableView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 24/01/2022.
//

import UIKit

class FitTableView : UITableView {
    public override var contentSize:CGSize {
           didSet {
               self.invalidateIntrinsicContentSize()
           }
       }

       public override var intrinsicContentSize: CGSize {
            self.layoutIfNeeded()
        self.isScrollEnabled = false
            return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
       }
}


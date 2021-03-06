//
//  Extensions.swift
//  Library
//
//  Created by yusef naser on 18/01/2022.
//

import UIKit
import PINRemoteImage

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil , leading: NSLayoutXAxisAnchor? = nil , bottom: NSLayoutYAxisAnchor? = nil , trailing: NSLayoutXAxisAnchor? = nil , centerX:NSLayoutXAxisAnchor? = nil ,centerY: NSLayoutYAxisAnchor? = nil ,paddingTop: CGFloat = 0 ,paddingLeft: CGFloat = 0 ,paddingBottom: CGFloat = 0 ,paddingRight: CGFloat = 0 , width: CGFloat = 0 ,height: CGFloat = 0 ,paddingCenterX: CGFloat = 0 ,paddingCenterY: CGFloat = 0) {
           translatesAutoresizingMaskIntoConstraints = false
           
           if let top = top {
               topAnchor.constraint(equalTo: top, constant:paddingTop).isActive = true
           }
           
           if let left = leading {
               leadingAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
           }
           
           if let bottom = bottom {
               bottomAnchor.constraint(equalTo: bottom, constant:-paddingBottom).isActive = true
           }
           
           if let right = trailing {
               trailingAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
           }
           
           if width != 0 {
               widthAnchor.constraint(equalToConstant: width).isActive = true
           }
           
           if height != 0 {
               heightAnchor.constraint(equalToConstant: height).isActive = true
           }
           if let centerX = centerX {
               centerXAnchor.constraint(equalTo: centerX, constant: paddingCenterX).isActive = true
           }
           if let centerY = centerY {
               centerYAnchor.constraint(equalTo: centerY, constant: paddingCenterY).isActive = true
           }
       }
    
    
}

public extension UIScrollView {
    func addRefreshController() -> UIRefreshControl {
        let r = UIRefreshControl()
      //  r.attributedTitle = NSAttributedString(string: SString.loading )
        self.refreshControl = r
        self.addSubview(r)
        return r
    }
}

public extension UITableViewCell {
    static func getIdentifier () -> String  {
        return String(describing: self)
    }
    
}

public extension UICollectionViewCell {
    static func getIdentifier () -> String  {
        return String(describing: self)
    }
}


public extension UIImageView {

    func loadImage (url : String , placeHolder : UIImage = #imageLiteral(resourceName: "placeholder") ) {
        self.pin_updateWithProgress = true
        self.pin_setImage(from: URL(string: url ) , placeholderImage: placeHolder )
    }

    
    func setTintColor (color : UIColor) {
        self.image = self.image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
}


extension Date {
    func getDateString (formate : String , afterPeriodOfMonths : Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formate
        dateFormatter.locale = Locale(identifier: "en" )
        if afterPeriodOfMonths > 0 {
            return dateFormatter.string(from: Calendar.current.date(byAdding: .month , value: afterPeriodOfMonths, to: self ) ?? self)
        }else {
           return dateFormatter.string(from: self)
        }
    }
}


func openURL (url : String) {
    if let url = URL(string: url) {
        UIApplication.shared.open(url)
    }
}

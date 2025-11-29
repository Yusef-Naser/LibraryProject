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
        var newURL = url
        self.pin_updateWithProgress = true
        if !url.contains("https") {
            newURL = url.replacingOccurrences(of: "http", with: "https")
        }
        self.pin_setImage(from: URL(string: newURL ) , placeholderImage: placeHolder )
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

extension UIFont {
    
    enum FontSize: CGFloat {
            case size_10 = 10
            case size_12 = 12
            case size_14 = 14
            case size_16 = 16
            case size_18 = 18
            case size_20 = 20
            case size_24 = 24
            case size_28 = 28
            case size_32 = 32
        }
    
    static func regular(size : FontSize) -> UIFont {
        guard let font = UIFont(name: "Alexandria-Regular", size: size.rawValue) else {
            return UIFont.systemFont(ofSize: size.rawValue)
        }
        return font
    }
    
    static func regular(size : CGFloat) -> UIFont {
        guard let font = UIFont(name: "Alexandria-Regular", size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return font
    }
    
    static func bold(size : FontSize)-> UIFont {
        guard let font = UIFont(name: "Alexandria-Bold", size: size.rawValue) else {
            return UIFont.boldSystemFont(ofSize: size.rawValue )
        }
        return font
    }
    
    static func bold(size : CGFloat)-> UIFont {
        guard let font = UIFont(name: "Alexandria-Bold", size: size) else {
            return UIFont.boldSystemFont(ofSize: size )
        }
        return font
    }
    
}

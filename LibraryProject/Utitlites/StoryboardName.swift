//
//  StoryboardName.swift
//  LibraryProject
//
//  Created by Khaled Elshamy on 21/01/2022.
//

import Foundation


enum StoryboardName: String {
    
    case MainLayoutTaps
    
    var fileName: String {
        return self.rawValue.prefix(1).uppercased() + self.rawValue.dropFirst()
    }
}

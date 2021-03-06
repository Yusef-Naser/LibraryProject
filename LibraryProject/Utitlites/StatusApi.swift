//
//  StatusApi.swift
//  LibraryProject
//
//  Created by Yusef Naser on 22/01/2022.
//

import Foundation

protocol StatusApi : AnyObject {
    func showMessage(_ message: String)
    func showLoading()
    func hideLoading()
}

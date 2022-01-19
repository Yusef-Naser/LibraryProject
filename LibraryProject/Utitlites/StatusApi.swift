//
//  StatusApi.swift
//  Library
//
//  Created by yusef naser on 18/01/2022.
//

protocol StatusApi : AnyObject {
    
    func onError(_ message : String )
    func onFailure (_ message : String )
    func showLoading ()
    func hideLoading ()
    
}

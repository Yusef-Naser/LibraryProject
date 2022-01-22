//
//  MainLayoutTapsRouter.swift
//  LibraryProject
//
//  Created by Khaled Elshamy on 21/01/2022.
//

import Foundation


class MainLayoutTapsRouter {
    static func createModule()-> MainLayoutTapsViewController {
        let view = MainLayoutTapsViewController.instantiate(storyboardName: .MainLayoutTaps)
        return view
    }

}

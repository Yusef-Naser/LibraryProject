//
//  ProfileVC.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//

import UIKit

class ProfileVC : BaseVC<ProfileView> {
    
    private var presenter : ProProfilePresetner?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        presenter = ProfilePresenter(view : self )
        mainView.navigation.delegateNavigation = self
        mainView.buttonUpdate.addTarget(self , action: #selector(actionUpdate ), for: .touchUpInside)
    }
    
    @objc private func actionUpdate () {
        presenter?.updateProfile(name: mainView.textfieldName.text ?? "" ,
                                 city: mainView.textfieldCity.text ?? "" ,
                                 address: mainView.textfieldAddress.text ?? "",
                                 categoryID: mainView.textfieldCategoryID.text ?? "",
                                 libraryID: mainView.textfieldLibraryID.text ?? "" )
    }
    
    
}

extension ProfileVC : ProProfileView , NavigationBarDelegate {
    
    func fetchData() {
        mainView.textfieldName.text = presenter?.getUserData()?.surname
        mainView.textfieldCity.text = presenter?.getUserData()?.city
        mainView.textfieldAddress.text = presenter?.getUserData()?.address
        mainView.textfieldCategoryID.text = presenter?.getUserData()?.categoryID
        mainView.textfieldLibraryID.text = presenter?.getUserData()?.libraryID
        self.navigationController?.popViewController(animated: true)
    }
    
    func navigationDismissView() {
        self.navigationController?.popViewController(animated: true )
    }
}

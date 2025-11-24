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
        self.presenter?.getUserData()
        self.presenter?.getLibraries()
        self.presenter?.getCategoreis()
        mainView.pickerViewLibrary.delegate = self
        mainView.pickerViewLibrary.dataSource = self
        mainView.pickerViewCategory.delegate = self
        mainView.pickerViewCategory.dataSource = self
        mainView.completionActionDoneToolBarLibrary = { [weak self] in
            if self?.mainView.textfieldLibraryID.text == "" {
                let id = self?.presenter?.getLibrary(index: 0)?.libraryID ?? ""
                self?.mainView.textfieldLibraryID.text = id
            }
            self?.mainView.endEditing(true)
        }
        
      
        mainView.completionActionDoneToolBarCategory = { [weak self] in
            if self?.mainView.textfieldCategoryID.text == "" {
                let name = self?.presenter?.getCategoryString(index: 0)
                self?.mainView.textfieldCategoryID.text = name
            }
            self?.mainView.endEditing(true)
        }
        mainView.buttonUpdate.addTarget(self , action: #selector(actionUpdate ), for: .touchUpInside)
    }
    
    @objc private func actionUpdate () {
        presenter?.updateProfile(name: mainView.textfieldName.text ?? "" ,
                                 city: mainView.textfieldCity.text ?? "" ,
                                 address: mainView.textfieldAddress.text ?? "",
                                // categoryID: mainView.textfieldCategoryID.text ?? "",
                                 libraryID: mainView.textfieldLibraryID.text ?? "" )
    }
    
    
}

extension ProfileVC : ProProfileView , NavigationBarDelegate {
    
    func fetchData() {
        mainView.textfieldName.text = presenter?.getUserObject()?.surname
        mainView.textfieldCity.text = presenter?.getUserObject()?.city
        mainView.textfieldAddress.text = presenter?.getUserObject()?.address
        mainView.textfieldCategoryID.text = presenter?.getUserObject()?.categoryID
        mainView.textfieldLibraryID.text = presenter?.getUserObject()?.libraryID
      //  self.navigationController?.popViewController(animated: true)
    }
    
    func fetchLibraries() {
        mainView.pickerViewLibrary.reloadAllComponents()
    }
    
    func fetchCategories() {
        mainView.pickerViewCategory.reloadAllComponents()
    }
    func navigationDismissView() {
        self.navigationController?.popViewController(animated: true )
    }
}

extension ProfileVC : UIPickerViewDataSource , UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == mainView.CATEGORY_TAG {
            return presenter?.getCategoreisCount() ?? 0
        }
        return presenter?.getLibrariesCount() ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == mainView.LIBRARY_TAG {
            let name = presenter?.getLibrary(index: row)?.name ?? ""
            let id = presenter?.getLibrary(index: row)?.libraryID ?? ""
            return name + "(\(id)"
        }
        let name = presenter?.getCategoryString(index: row)
        return name
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == mainView.LIBRARY_TAG {
            let name = presenter?.getLibrary(index: row)?.name ?? ""
            let id = presenter?.getLibrary(index: row)?.libraryID ?? ""
            mainView.textfieldLibraryID.text = id
        }
        let name = presenter?.getCategory(index: row)?.keys.first ?? ""
        mainView.textfieldCategoryID.text = name
    }
    
}

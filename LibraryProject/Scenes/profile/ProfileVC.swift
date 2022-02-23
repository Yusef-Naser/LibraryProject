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
        self.presenter?.getLibraries()
        mainView.pickerViewTopics.delegate = self
        mainView.pickerViewTopics.dataSource = self
        mainView.completionActionDoneToolBar = { [weak self] in
            if self?.mainView.textfieldLibraryID.text == "" {
                let name = self?.presenter?.getLibrary(index: 0)?.name ?? ""
                let id = self?.presenter?.getLibrary(index: 0)?.libraryID ?? ""
                self?.mainView.textfieldLibraryID.text = name + "(\(id))"
            }
            self?.mainView.endEditing(true)
        }
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
    
    func fetchLibraries() {
        mainView.pickerViewTopics.reloadAllComponents()
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
        return presenter?.getLibrariesCount() ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let name = presenter?.getLibrary(index: row)?.name ?? ""
        let id = presenter?.getLibrary(index: row)?.libraryID ?? ""
        return name + "(\(id)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let name = presenter?.getLibrary(index: row)?.name ?? ""
        let id = presenter?.getLibrary(index: row)?.libraryID ?? ""
        mainView.textfieldLibraryID.text = name + "(\(id))"
    }
    
    
    
}

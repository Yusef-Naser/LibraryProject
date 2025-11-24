//
//  AddSuggestVC.swift
//  LibraryProject
//
//  Created by Yusef Naser on 12/02/2022.
//

import UIKit

class AddSuggestVC : BaseVC<AddSuggestView> {
    
    private var presenter : ProAddSuggestPresetner?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        presenter = AddSuggestPresenter(view : self )
        mainView.navigation.delegateNavigation = self
        mainView.buttonSubmit.addTarget(self , action: #selector(actionSubmit), for: .touchUpInside)
        presenter?.getLibraries()
        mainView.pickerViewTopics.delegate = self
        mainView.pickerViewTopics.dataSource = self
        mainView.completionActionDoneLibrary = { [weak self] in
            if self?.mainView.textFieldLibrary.text == "" {
                let name = self?.presenter?.getLibrary(index: 0)?.name ?? ""
                let id = self?.presenter?.getLibrary(index: 0)?.libraryID ?? ""
                self?.mainView.textFieldLibrary.text = id
            }
            self?.mainView.endEditing(true)
        }
        
        mainView.completionActionCopyRightDate = { [weak self] in
            if self?.mainView.textFieldCopyRightDate.text == "" {
                self?.mainView.textFieldCopyRightDate.text = Date().getDateString(formate: "yyyy-MM-dd", afterPeriodOfMonths: 0)
            }
            self?.mainView.endEditing(true)
        }
        
        mainView.pickerDate.addTarget(self , action: #selector(actionSelectDate), for: .valueChanged)
        
    }
    
    @objc private func actionSelectDate () {
        self.mainView.textFieldCopyRightDate.text = mainView.pickerDate.date.getDateString(formate: "yyyy-MM-dd", afterPeriodOfMonths: 0)
    }
    
    @objc private func actionSubmit () {
        presenter?.addSuggest(title: mainView.textFieldTitle.text ?? "" ,
                              author: mainView.textFieldAuthor.text ?? "" ,
                              copyRightDate: mainView.textFieldCopyRightDate.text ?? "" ,
                              publisher: mainView.textFieldPublisher.text ?? "" ,
                              collectionTitle: mainView.textFieldCollectionTitle.text ?? "",
                              publicationPlace: mainView.textFieldPublicationPlace.text ?? "" ,
                              quantity: mainView.textFieldQuantity.text ?? "" ,
                              itemType: mainView.textFieldItemType.text ?? "" ,
                              library: mainView.textFieldLibrary.text ?? "" ,
                              notes: mainView.textFieldNotes.text ?? "")
    }
    
    
    
}

extension AddSuggestVC : ProAddSuggestView , NavigationBarDelegate {
    func navigationDismissView() {
        self.navigationController?.popViewController(animated: true )
    }
    
    func fetchData() {
        self.navigationController?.popViewController(animated: true )
    }
    
    func fetchLibraries() {
        mainView.pickerViewTopics.reloadAllComponents()
    }
}

extension AddSuggestVC : UIPickerViewDataSource , UIPickerViewDelegate {
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
        mainView.textFieldLibrary.text = id
    }
    
    
    
}


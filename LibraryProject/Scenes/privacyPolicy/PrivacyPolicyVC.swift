//
//  PrivacyPolicyVC.swift
//  LibraryProject
//
//  Created by yusef naser on 29/11/2025.
//

import UIKit

class PrivacyPolicyVC : BaseVC<PrivacyPolicyView> {
    
    var presenter : ProPrivacyPolicyPresenter? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = PrivacyPolicyPresenter(view: self)
        mainView.navigation.delegateNavigation = self
        presenter?.getPrivacyPolicy()
    }
    
}
extension PrivacyPolicyVC : ProPrivacyPolicyView , NavigationBarDelegate {
    
    func navigationDismissView() {
        self.navigationController?.popViewController(animated: true )
    }
    
    func fetchDate() {
        let item = presenter?.privacyObject()
        var title = ""
        var description = ""
        if SharedData.instance.getLangauge().contains(LanguageEnum.en.rawValue) {
            title = item?.data?.titleEn ?? ""
            description = item?.data?.descriptionEn ?? ""
        }else {
            title = item?.data?.title ?? ""
            description = item?.data?.description ?? ""
        }
        
       
        if presenter?.isHTML(title) == true ,
           let attributed = presenter?.convertHtmlTagsToAttributedString(string: title){
            mainView.setTitleAttributed(attributed: attributed)
        }else {
            mainView.setTitle(title: title)
        }
        
        if  presenter?.isHTML(description) == true ,
           let attributed = presenter?.convertHtmlTagsToAttributedString(string: description) {
            mainView.setDescriptionAttributed(attributed: attributed)
        }else {
            mainView.setDescription(description: description)
        }
        
    }
    
}

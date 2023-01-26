//
//  MenuPresenter.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//VC


protocol ProMenuView : StatusApi {
    
}

protocol ProMenuPresetner {

    func addCheckout (barcode: String , date : String , cardNumber : String)
    func removeCheckout (barcode : String)
    
    func getListMenu () -> [String]
    
}


class MenuPresenter : ProMenuPresetner {
   
    
    weak var view : ProMenuView?
    private let interactor = MenuInteractor()
    
    init(view : ProMenuView ) {
        self.view = view
    }
    
    func addCheckout(barcode: String , date : String , cardNumber : String) {
        self.view?.showLoading()
        interactor.addCheckout(barcode: barcode , date :date , cardNumber: cardNumber ) { data , error , statusCode in
            self.view?.hideLoading()
            if data?.status == 201 || data?.status == 200 || data?.error == "{\"confirm\":{\"RENEW_ISSUE\":1}}" {
                self.view?.showMessage("success")
            }else {
                self.view?.showMessage("error")
            }
        }
    }
    
    func removeCheckout(barcode: String) {
        self.view?.showLoading()
        interactor.removeCheckout(barcode: barcode) { data , error , statusCode in
            self.view?.hideLoading()
            if data == "" || statusCode == 200 || statusCode == 201 {
                self.view?.showMessage("success")
            }else {
                self.view?.showMessage( "error")
            }
        }
    }
    
    func getListMenu() -> [String] {
        if SharedData.instance.getUserID() == 0 {
            return [
                SharedData.instance.getLangauge().contains( LanguageEnum.en.rawValue) ? "العربية" : "English" ,
                SString.login]
        }else {
            return [SString.changePassword ,
                    SString.profile ,
                    SString.checkoutList ,
                    "" ,
                    SString.holdList ,
                    SString.suggestions ,
                    SharedData.instance.getLangauge().contains( LanguageEnum.en.rawValue) ? "العربية" : "English" ,
                    SString.logout]
        }
    }
    
}

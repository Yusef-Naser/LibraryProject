//
//  MenuPresenter.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//VC


protocol ProMenuView : StatusApi {
    
}

protocol ProMenuPresetner {

    func addCheckout (barcode: String)
    func removeCheckout (barcode : String)
    
}


class MenuPresenter : ProMenuPresetner {
   
    
    weak var view : ProMenuView?
    private let interactor = MenuInteractor()
    
    init(view : ProMenuView ) {
        self.view = view
    }
    
    func addCheckout(barcode: String) {
        self.view?.showLoading()
        interactor.addCheckout(barcode: barcode) { data , error , statusCode in
            self.view?.hideLoading()
            if data == "" {
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
            if data == "" {
                self.view?.showMessage("success")
            }else {
                self.view?.showMessage("error")
            }
        }
    }
    
}

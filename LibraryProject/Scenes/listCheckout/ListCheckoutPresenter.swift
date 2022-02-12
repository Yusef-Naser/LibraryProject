//
//  ListCheckoutPresenter.swift
//  LibraryProject
//
//  Created by Yusef Naser on 09/02/2022.
//VC


protocol ProListCheckoutView : StatusApi {
    func fetchCheckoutList ()
}

protocol ProListCheckoutPresetner {

    func getCheckoutList ()
    func getCount () -> Int
    func getCheckoutElement (index : Int) -> ModelCheckoutElement?
    func refreshCheckout ()
    
}


class ListCheckoutPresenter : ProListCheckoutPresetner {
    
    weak var view : ProListCheckoutView?
    private let interactor = ListCheckoutInteractor()
    
    private var listCheckoutArray = ModelCheckout()
    
    init(view : ProListCheckoutView ) {
        self.view = view
    }
    
    func getCheckoutList() {
        interactor.getCheckoutList { data , error , statusCode in
            guard let data = data else {
                return
            }
            self.listCheckoutArray = data
            self.view?.fetchCheckoutList()
        }
    }
    
    func getCount() -> Int {
        listCheckoutArray.count
    }
    
    func getCheckoutElement(index: Int) -> ModelCheckoutElement? {
        guard getCount() > index else {
            return nil
        }
        return listCheckoutArray[index]
    }
    
    func refreshCheckout() {
        listCheckoutArray = []
        getCheckoutList()
    }
    
}

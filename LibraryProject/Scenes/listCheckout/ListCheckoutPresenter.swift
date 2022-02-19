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

    
    func getListData ()
    func getCount () -> Int
    func getCheckoutElement (index : Int) -> ModelBook?
    func refreshCheckout ()
    
}


class ListCheckoutPresenter : ProListCheckoutPresetner {
    
    weak var view : ProListCheckoutView?
    private let interactor = ListCheckoutInteractor()
    private var screenType : ScreenType = .none
    
    private var listCheckoutArray = ModelCheckout()
    private var listItems =  [ModelItem]()
    private var listBooks = [ModelBook]()
    private var listHolds = ModelListHold()
    
    init(view : ProListCheckoutView , screenType : ScreenType) {
        self.view = view
        self.screenType = screenType
    }
    
    func getListData() {
        switch screenType {
        case .checkout:
            getCheckoutList()
        case .hold:
            getHoldList()
        case .none:
            break
        }
    }
    
    func getHoldList () {
        interactor.getHoldList { data , error , statusCode in
            guard let data = data else {
                return
            }
            self.listHolds = data
            guard self.listHolds.count > 0 else {
                return
            }
            self.getBookForHold(bibloID: "\(self.listHolds[0].biblioID ?? 0)")
        }
    }
    
    func getBookForHold (bibloID : String) {
        
        interactor.getBook(bibloID: bibloID) { data , error , statusCode in
            guard let data = data else {
                self.view?.fetchCheckoutList()
                return
            }
            self.listBooks.append(data)
            self.listHolds.remove(at: 0)
            guard self.listHolds.count > 0 else {
                self.view?.fetchCheckoutList()
                return
            }
            self.getBookForHold(bibloID: "\(self.listHolds[0].biblioID ?? 0)")
        }
        
    }
    
    
    func getCheckoutList() {
        interactor.getCheckoutList { data , error , statusCode in
            guard let data = data else {
                return
            }
            self.listCheckoutArray = data
            //self.view?.fetchCheckoutList()
            guard self.listCheckoutArray.count > 0 else {
                return
            }
            self.getItem(itemID: "\(self.listCheckoutArray[0].itemID ?? 0)")
        }
    }
    
    func getItem (itemID : String) {
        
        interactor.getItem(item: itemID) { data , error , statusCode in
            guard let data = data else {
                guard self.listItems.count > 0 else {
                    return
                }
                self.getBook(bibloID: "\(self.listItems[0].biblioID ?? 0)")
                return
            }
            self.listItems.append(data)
            self.listCheckoutArray.remove(at: 0)
            guard self.listCheckoutArray.count > 0 else {
                guard self.listItems.count > 0 else {
                    return
                }
                self.getBook(bibloID: "\(self.listItems[0].biblioID ?? 0)")
                return
            }
            self.getItem(itemID: "\(self.listCheckoutArray[0].itemID ?? 0)")
        }
    }
    
    func getBook (bibloID : String) {
        interactor.getBook(bibloID: bibloID) { data , error , statusCode in
            guard let data = data else {
                self.view?.fetchCheckoutList()
                return
            }
            self.listBooks.append(data)
            self.listItems.remove(at: 0)
            guard self.listItems.count > 0 else {
                self.view?.fetchCheckoutList()
                return
            }
            self.getBook(bibloID: "\(self.listItems[0].biblioID ?? 0)")
        }
    }
    
    func getCount() -> Int {
        listBooks.count
    }
    
    func getCheckoutElement(index: Int) -> ModelBook? {
        guard getCount() > index else {
            return nil
        }
        return listBooks[index]
    }
    
    func refreshCheckout() {
        listBooks = []
        getCheckoutList()
    }
    
}

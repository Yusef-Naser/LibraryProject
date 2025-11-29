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
    func getHoldItem(index: Int) -> ModelHoldElement? 
    func getBiblioID (index : Int) -> Int?
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
        self.view?.showLoading()
        interactor.getHoldList { data , error , statusCode in
            guard let data = data else {
                return
            }
            self.listHolds = data
            guard self.listHolds.count > 0 else {
                return
            }
            self.getBookForHold(index: 0)
        }
    }
    
    func getBookForHold (index : Int) {
        guard self.listHolds.count > index else {
            self.view?.hideLoading()
            self.view?.fetchCheckoutList()
            return
        }

        let item = self.listHolds[index]
        interactor.getBook(bibloID: "\(item.biblioID ?? 0)" ) { data , error , statusCode in
            guard let data = data else {
                self.view?.hideLoading()
                self.view?.fetchCheckoutList()
                return
            }
            self.listBooks.append(data)
           // self.listHolds.remove(at: 0)
//            guard self.listHolds.count > 0 else {
//                self.view?.hideLoading()
//                self.view?.fetchCheckoutList()
//                return
//            }
            self.getBookForHold(index: index + 1)
        }
        
    }
    
    
    func getCheckoutList() {
        self.view?.showLoading()
        interactor.getCheckoutList { data , error , statusCode in
            
            guard let data = data else {
                self.view?.hideLoading()
                return
            }
            self.listCheckoutArray = data
            //self.view?.fetchCheckoutList()
            guard self.listCheckoutArray.count > 0 else {
                self.view?.hideLoading()
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
                self.getBook(index: 0)
                return
            }
            self.listItems.append(data)
            self.listCheckoutArray.remove(at: 0)
            guard self.listCheckoutArray.count > 0 else {
                guard self.listItems.count > 0 else {
                    return
                }
                self.getBook(index: 0)
                return
            }
            self.getItem(itemID: "\(self.listCheckoutArray[0].itemID ?? 0)")
        }
    }
    
    func getBook (index : Int) {
        guard self.listItems.count > index else {
            self.view?.hideLoading()
            self.view?.fetchCheckoutList()
            return
        }

        let item = listItems[index]
        interactor.getBook(bibloID: "\(item.biblioID ?? 0)") { data , error , statusCode in
            guard let data = data else {
                self.view?.hideLoading()
                self.view?.fetchCheckoutList()
                return
            }
            self.listBooks.append(data)
//            self.listItems.remove(at: 0)
//            guard self.listItems.count > 0 else {
//                self.view?.hideLoading()
//                self.view?.fetchCheckoutList()
//                return
//            }
            self.getBook(index: index + 1)
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
    func getBiblioID(index: Int) -> Int? {
        switch screenType {
        case .checkout:
            guard self.listItems.count > index else {
                return nil
            }
            return self.listItems[index].biblioID
        case .hold:
            guard listHolds.count > index else {
                return nil
            }
            return listHolds[index].biblioID
        case .none:
            return nil
        }
    }
    func getHoldItem(index: Int) -> ModelHoldElement? {
        
            guard listHolds.count > index else {
                return nil
            }
            return listHolds[index]
       
       
    }
    
    func refreshCheckout() {
        listBooks = []
        listHolds = []
        listItems = []
        listCheckoutArray = []
        getListData()
    }
    
}

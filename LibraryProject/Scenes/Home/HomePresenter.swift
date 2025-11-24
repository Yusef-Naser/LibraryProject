//
//  HomePresenter.swift
//  Library
//
//  Created by yusef naser on 18/01/2022.
//VC


protocol ProHomeView : StatusApi {
    func getListNewBooks (list :  [ModelLatest])
    func getListFeatureBooks (list :  [ModelFeaturedBook])
    func getSuggestedBooks (list :  [ModelSuggestedBook])
}

protocol ProHomePresetner {

    var modelfeatured : ModelFeatured? {get set}
    func getLatest ()
    func getFeatured ()
    func getFeaturedItem(index : Int) -> ModelFeaturedBook?
    func getSuggestedBooks()
    func viewWillAppear()
    
}


class HomePresenter : ProHomePresetner {
    
    
    
    weak var view : ProHomeView?
    private let interactor = HomeInteractor()
    
    var modelfeatured : ModelFeatured? = nil
    private var latest : ModelArrayLatest = []
    private var suggestedBooks : [ModelSuggestedBook] = []
    
    init(view : ProHomeView ) {
        self.view = view
        getLatest()
        getFeatured()
        getSuggestedBooks()
    }
    
    func getFeatured() {
        self.view?.showLoading()
        interactor.getFeatured { data , error , statusCode in
            self.view?.hideLoading()
            
            guard let data = data else {
                return
            }
            self.modelfeatured = data
            
            self.view?.getListFeatureBooks(list: data.data?.books ?? [] )
        }
    }
    
    func getLatest() {
        self.view?.showLoading()
        interactor.getLatest { data , error , statusCode in
            self.view?.hideLoading()
            guard var data = data else {
                return
            }
            for ( index , var item) in data.enumerated() {
                
                item.image = BASEIMAGEURL("\(item.biblionumber ?? 0)")
                data.remove(at: index)
                data.insert(item, at: index)
            }
            self.latest = data
            self.view?.getListNewBooks(list: data)
        }
    }
    
    func getSuggestedBooks() {
        self.view?.showLoading()
        interactor.getSuggestedBooks { data , error , statusCode in
            self.view?.hideLoading()
            guard let data = data?.data else {
                self.view?.getSuggestedBooks(list: [])
                return
            }
            
            self.suggestedBooks = data
            self.view?.getSuggestedBooks(list: data)
        }
    }
    
    
    
//    func getSlider(index: Int) -> ModelSlider? {
//        guard sliderArray.count > index else {
//            return nil
//        }
//        return sliderArray[index]
//    }
//    
//    func getSliderCount() -> Int {
//        sliderArray.count
//    }

    func viewWillAppear() {
        self.view?.getListFeatureBooks(list: self.modelfeatured?.data?.books ?? [])
        self.view?.getListNewBooks(list: latest)
        self.view?.getSuggestedBooks(list: self.suggestedBooks)
    }
    
    func getFeaturedItem(index: Int) -> ModelFeaturedBook? {
        guard (self.modelfeatured?.data?.books?.count ?? 0) > index ,  let item = self.modelfeatured?.data?.books?[index] else {
            return nil
        }
        return item
    }
}

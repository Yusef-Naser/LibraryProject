//
//  HomePresenter.swift
//  Library
//
//  Created by yusef naser on 18/01/2022.
//VC


protocol ProHomeView : StatusApi {
    func getListNewBooks (list :  [ModelLatest])
    func getListFeatureBooks (list :  [ModelLatest])
    func fetchData ()
}

protocol ProHomePresetner {

    func getHome ()
    func getLatest ()
    func getSlider(index : Int) -> ModelSlider?
    func getSliderCount () -> Int
    
}


class HomePresenter : ProHomePresetner {
    
    
    
    weak var view : ProHomeView?
    private let interactor = HomeInteractor()
    
    private var sliderArray : [ModelSlider] = []
    
    init(view : ProHomeView ) {
        self.view = view
        getHome()
        getLatest()
    }
    
    func getHome() {
        self.view?.showLoading()
        interactor.getHome { data , error , statusCode in
            self.view?.hideLoading()
            
            guard let data = data else {
                return
            }
          //  self.view?.getListNewBooks(list: data.menu?.homePage?.latest ?? [])
            self.view?.getListFeatureBooks(list: data.menu?.homePage?.suggested ?? [])
            self.sliderArray = data.menu?.homePage?.silder ?? []
            if let c = data.menu?.categories , c.count > 0 {
                var variable : [String:String] = [:]
                c.forEach { item in
                    variable[item.keys.first ?? ""] = item.values.first ?? ""
                }
                SharedData.instance.setCategories(categories: variable)
            }
            self.view?.fetchData()
        }
    }
    
    func getLatest() {
        self.view?.showLoading()
        interactor.getLatest { data , error , statusCode in
            self.view?.hideLoading()
            guard let data = data else {
                return
            }
            self.view?.getListNewBooks(list: data)
        }
    }
    
    func getSlider(index: Int) -> ModelSlider? {
        guard sliderArray.count > index else {
            return nil
        }
        return sliderArray[index]
    }
    
    func getSliderCount() -> Int {
        sliderArray.count
    }
    
}

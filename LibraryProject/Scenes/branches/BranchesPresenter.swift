//
//  BranchesPresenter.swift
//  LibraryProject
//
//  Created by yusef naser on 23/11/2025.
//

protocol ProBranchesView : StatusApi {
    func fetchData ()
}

protocol ProBranchesPresetner {

    func getBranches ()
    func getBranchesCount () -> Int
    func getBranche (index : Int) -> ModelBranch?
}


class BranchesPresenter : ProBranchesPresetner {
    
    weak var view : ProBranchesView?
    private let interactor = BranchesInteractor()
    
    private var branches : ModelBranches?
    
    init(view : ProBranchesView ) {
        self.view = view
        getBranches()
    }
    
    func getBranches() {
        self.view?.showLoading()
        interactor.getBranches { data , error, statusCode in
            self.view?.hideLoading()
            
            guard let data = data else {
                return
            }
            self.branches = data
            self.view?.fetchData()
        }
    }
    
    func getBranchesCount() -> Int {
        self.branches?.count ?? 0
    }
    
    func getBranche(index: Int) -> ModelBranch? {
        guard ( self.branches?.count ?? 0 ) > index , let branch = self.branches?[index] else {
            return nil
        }
        return branch
    }
    
    
    
}

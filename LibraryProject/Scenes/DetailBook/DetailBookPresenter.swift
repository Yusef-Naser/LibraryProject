//
//  DetailBookPresenter.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//VC


protocol ProDetailBookView : StatusApi {
    func fetchData ()
}

protocol ProDetailBookPresetner {

    func getBookDetails ( id : Int )
    func setConfigurationView (view : DetailBookViewConfiguration)
}


class DetailBookPresenter : ProDetailBookPresetner {
    
    weak var view : ProDetailBookView?
    private let interactor = DetailBookInteractor()
    
    private var modelBook : ModelBook? = nil
    
    
    init(view : ProDetailBookView ) {
        self.view = view
    }
    
    func getBookDetails(id: Int) {
        interactor.getBookDetails(bookID: id) { data , error , statusCode in
            guard let data = data else {
                return
            }
            
            self.modelBook = data
            self.view?.fetchData()
        }
    }
    
    func setConfigurationView(view: DetailBookViewConfiguration) {
        guard let model = modelBook else {
            return
        }
        view.setTitle(title: model.getTitle(type: .title))
        view.setPersonalName(name: model.getTitle(type: .personalName))
        view.setPublicationDetails(details: model.getTitle(type: .publicationDetails))
        view.setSubjects(subjects: model.getTitle(type: .subjects))
        view.DDCClassification(classification: model.getTitle(type: .classificationNumber))
        view.getDescription(des: model.getTitle(type: .description))
    }
    
}

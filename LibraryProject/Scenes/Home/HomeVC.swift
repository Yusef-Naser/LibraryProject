//
//  HomeVC.swift
//  Library
//
//  Created by yusef naser on 18/01/2022.
//

import UIKit

class HomeVC : BaseVC<HomeView> {
    
    private var presenter : ProHomePresetner?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        presenter = HomePresenter(view : self )
        mainView.setDelegates(delegate: self ) // collectionview and SectionBooksViewDelegate
        mainView.searchView.addGestureRecognizer(UITapGestureRecognizer(target: self , action: #selector(actionSearch)))
        
    }
    
    @objc private func actionSearch () {
        parentNavigationController?.pushViewController(SearchVC() , animated: true )
    }
    
}

extension HomeVC : ProHomeView {
    func getListNewBooks(list: [ModelLatest]) {
        mainView.sectionNewBooks.arrayItems = list
    }
    
    func getListFeatureBooks(list: [ModelLatest]) {
        mainView.sectionFeatureBooks.arrayItems = list
    }
    
    func fetchData() {
        mainView.collectioViewSlider.reloadData()
    }
    
}

extension HomeVC : SectionBooksViewDelegate {
    
    func clickOnBook(item: ModelLatest?) {
        self.navigationController?.pushViewController(DetailBookVC(bookItem: item ), animated: true )
    }
    
}

extension HomeVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // mainView.listSlider.count
        presenter?.getSliderCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellSlider.getIdentifier() , for: indexPath ) as! CellSlider
        cell.setImage(image: presenter?.getSlider(index: indexPath.row)?.image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: collectionView.frame.width - (collectionView.frame.width / 3) , height: collectionView.frame.height - 10 )
    }

}

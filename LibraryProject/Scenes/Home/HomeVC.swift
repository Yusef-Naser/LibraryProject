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
        parentNavigationController?.pushViewController(SearchVC(blink: nil ) , animated: true )
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
        cell.setTitle(title: presenter?.getSlider(index: indexPath.row)?.title)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2
        
        return CGSize (width: width  , height: width + 20  )
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let blink = presenter?.getSlider(index: indexPath.row)?.blink else {
            return
        }
        self.navigationController?.pushViewController(SearchVC(blink: blink ), animated: true )
        
    }
    
}

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
        mainView.setDelegates(delegate: self )
        
    }
    
    
}

extension HomeVC : ProHomeView {
    
}

extension HomeVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellSlider.getIdentifier() , for: indexPath ) as! CellSlider
        cell.setImage(image: #imageLiteral(resourceName: "nature"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: collectionView.frame.width - (collectionView.frame.width / 3) , height: collectionView.frame.height - 10 )
    }
    
    
}

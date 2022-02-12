//
//  ListCheckoutVC.swift
//  LibraryProject
//
//  Created by Yusef Naser on 09/02/2022.
//

import UIKit

class ListCheckoutVC : BaseVC<ListCheckoutView> {
    
    private var presenter : ProListCheckoutPresetner?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        presenter = ListCheckoutPresenter(view : self )
        presenter?.getCheckoutList()
        mainView.setDelegates(delegate: self )
        refreshController = mainView.tableView.addRefreshController()
        refreshController?.addTarget(self , action: #selector(actionRefresh ), for: .valueChanged)
        
    }
    
    @objc private func actionRefresh () {
        presenter?.refreshCheckout()
    }
    
}

extension ListCheckoutVC : ProListCheckoutView {
    func fetchCheckoutList() {
        mainView.tableView.reloadData()
    }
}

extension ListCheckoutVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.getCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellCheckout.getIdentifier() , for: indexPath ) as! CellCheckout
        
        return cell
    }
    
    
    
    
}

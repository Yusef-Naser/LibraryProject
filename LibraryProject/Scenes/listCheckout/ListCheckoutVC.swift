//
//  ListCheckoutVC.swift
//  LibraryProject
//
//  Created by Yusef Naser on 09/02/2022.
//

import UIKit

enum ScreenType {
    case checkout
    case hold
    case none
}

class ListCheckoutVC : BaseVC<ListCheckoutView> {
    
    private var presenter : ProListCheckoutPresetner?
    private var screenType : ScreenType = .none
    

    
    init(screenType : ScreenType) {
        super.init(nibName: nil , bundle: nil)
        self.screenType = screenType
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        presenter = ListCheckoutPresenter(view : self , screenType: screenType)
        mainView.setTitle(screenType: screenType)
        presenter?.getListData()
        mainView.setDelegates(delegate: self )
        refreshController = mainView.tableView.addRefreshController()
        refreshController?.addTarget(self , action: #selector(actionRefresh ), for: .valueChanged)
        
    }
    
    @objc private func actionRefresh () {
        presenter?.refreshCheckout()
    }
    

}

extension ListCheckoutVC : ProListCheckoutView , NavigationBarDelegate {
    func fetchCheckoutList() {
        mainView.tableView.reloadData()
    }
    func navigationDismissView() {
        self.navigationController?.popViewController(animated: true )
    }
}

extension ListCheckoutVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = presenter?.getCount() ?? 0
        if count == 0 {
            tableView.backgroundView = EmptyView(text: (screenType == .checkout) ? SString.theresNoCheckoutList : SString.theresNoHold )
        }else {
            tableView.backgroundView = nil
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellCheckout.getIdentifier() , for: indexPath ) as! CellCheckout
        let book = presenter?.getCheckoutElement(index: indexPath.row)
        cell.labelTitle.text = book?.getTitle(type: .title)
        cell.labelAuthorValue.text = book?.getTitle(type: .author)
        cell.labelCallNumberValue.text = book?.getTitle(type: .callNumber , subfields: [.a , .b])
        cell.labelItemTypeValue.text = book?.getTitle(type: .itemType , subfields: [.c])
        return cell
    }
    
}



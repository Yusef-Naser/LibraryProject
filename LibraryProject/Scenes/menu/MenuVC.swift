//
//  MenuVC.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//

import UIKit

class MenuVC : BaseVC<MenuView> {
    
    private var presenter : ProMenuPresetner?
    
    var listArrayMenu : [String] = [
        SString.changePassword ,
        SString.profile ,
        SString.checkoutList ,
        SString.holdList ,
        SString.suggestions
    ]
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        presenter = MenuPresenter(view : self )
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        
    }
    
    
}

extension MenuVC : ProMenuView {
    
}

extension MenuVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listArrayMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellMenu.getIdentifier() , for: indexPath) as! CellMenu

        cell.setTitle(title: listArrayMenu[indexPath.row] )
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch listArrayMenu[indexPath.row] {
        case SString.changePassword:
            self.navigationController?.pushViewController(ChangePasswordVC() , animated: true)
        case SString.profile :
            self.navigationController?.pushViewController(ProfileVC() , animated: true )
        case SString.checkoutList :
            self.navigationController?.pushViewController(ListCheckoutVC(screenType: .checkout) , animated: true )
        case SString.holdList :
            self.navigationController?.pushViewController(ListCheckoutVC(screenType: .hold ), animated: true )
        case SString.suggestions :
            self.navigationController?.pushViewController(SuggestionsVC() , animated: true)
        default:
            break
        }
    }
    
    
    
    
}

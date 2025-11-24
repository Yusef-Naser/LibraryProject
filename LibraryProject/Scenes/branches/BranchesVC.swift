//
//  BranchesVC.swift
//  LibraryProject
//
//  Created by yusef naser on 23/11/2025.
//

import UIKit

class BranchesVC : BaseVC<BranchesView> {
    
    var presenter : ProBranchesPresetner? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = BranchesPresenter(view: self)
        mainView.setDelegate(delegate: self)
        
    }
    
}

extension BranchesVC : ProBranchesView {
    
    func fetchData() {
        mainView.tableView.reloadData()
    }
    
}

extension BranchesVC : NavigationBarDelegate {
    func navigationDismissView() {
        navigationController?.popViewController(animated: true )
    }
}

extension BranchesVC : UITableViewDelegate , UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = presenter?.getBranchesCount() ?? 0
        if count == 0 {
            tableView.backgroundView = EmptyView(text: SString.thereIsNoBranches)
        }else {
            tableView.backgroundView = nil
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellBranch.getIdentifier(), for: indexPath ) as! CellBranch
        let item = presenter?.getBranche(index: indexPath.row)
        cell.setTitle(title: item?.name)
        cell.setCountry(country: item?.country, city: item?.city, state: item?.state)
        let address = "\(item?.address1 ?? ""),\(item?.address2 ?? ""),\(item?.address3 ?? "")"
        cell.setAddress(icon: "address_branch", title: SString.address, value: address)
        cell.setEmail(icon: "email_branch", title: SString.email, value: item?.postalCode ?? "")
        cell.setFax(icon: "fax_branch", title: SString.fax, value: item?.fax ?? "")
        cell.setPostalCode(icon: "postalCode_branch", title: SString.postalCode, value: item?.postalCode ?? "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = presenter?.getBranche(index: indexPath.row)
        if let url = item?.url ,  let urlObj = URL(string: url) {
            UIApplication.shared.open(urlObj)
        }
    }
    
    
}

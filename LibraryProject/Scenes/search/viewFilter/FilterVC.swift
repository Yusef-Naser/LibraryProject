//
//  FilterVC.swift
//  LibraryProject
//
//  Created by yusef naser on 17/11/2025.
//

import UIKit

class FilterVC : BaseVC<FilterVCView> {
    
    var completionSelect : ( ( String)->Void )?
    
    private let arrayFilter = [
        "ALL" ,
        "Title" ,
        "Author" ,
        "Subject" ,
        "ISBN" ,
        "ISSN" ,
        "Series" ,
        "Call number"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.close.addTarget(self, action: #selector(actionDismiss), for: .touchUpInside)
    }
    
    @objc private func actionDismiss () {
        self.dismiss(animated: true)
        self.navigationController?.popViewController(animated: true )
    }
    
}

extension FilterVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayFilter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FilterCell.getIdentifier() , for: indexPath) as! FilterCell
        cell.setText(text: arrayFilter[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = arrayFilter[indexPath.row]
        completionSelect?(item)
        actionDismiss()
    }
    
    
}

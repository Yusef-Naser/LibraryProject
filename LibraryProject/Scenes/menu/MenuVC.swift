//
//  MenuVC.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//

import UIKit
import BarcodeScanner

class MenuVC : BaseVC<MenuView> {
    
    private var presenter : ProMenuPresetner?
    private var scannerBarcode : BarcodeScannerViewController!
    
    private let TAG_CHECKIN = 220
    private let TAG_CHECKOUT = 223
    
    var listArrayMenu : [String] = [
        SString.changePassword ,
        SString.profile ,
        SString.checkoutList ,
        "" ,
        SString.holdList ,
        SString.suggestions ,
        SString.logout
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

extension MenuVC : UITableViewDelegate , UITableViewDataSource , CellMenuDelegate {
    
    func actionCheckin() {
        scannerBarcode = BarcodeScannerViewController()
        
        let l = UIButton()
        l.setTitle(SString.close , for: .normal)
        l.setTitleColor(.red , for: .normal)
        l.addTarget(self , action: #selector(actionCloseScanner), for: .touchUpInside)
        
        scannerBarcode.view.addSubview(l)
        l.anchor(top: scannerBarcode.view.safeAreaLayoutGuide.topAnchor , leading: scannerBarcode.view.leadingAnchor, paddingTop: 8, paddingLeft: 16 )
        scannerBarcode.view.tag = TAG_CHECKIN
        scannerBarcode.isOneTimeSearch = true
        scannerBarcode.codeDelegate = self
        scannerBarcode.errorDelegate = self
        scannerBarcode.dismissalDelegate = self
        

        self.navigationController?.pushViewController(scannerBarcode, animated: true)
    }
    
    func actionCheckout() {
        
        
        self.presenter?.addCheckout(barcode: "8230")
//        scannerBarcode = BarcodeScannerViewController()
//        
//        let l = UIButton()
//        l.setTitle(SString.close , for: .normal)
//        l.setTitleColor(.red , for: .normal)
//        l.addTarget(self , action: #selector(actionCloseScanner), for: .touchUpInside)
//        
//        scannerBarcode.view.addSubview(l)
//        l.anchor(top: scannerBarcode.view.safeAreaLayoutGuide.topAnchor , leading: scannerBarcode.view.leadingAnchor, paddingTop: 8, paddingLeft: 16 )
//        
//        scannerBarcode.view.tag = TAG_CHECKOUT
//        scannerBarcode.isOneTimeSearch = true
//        scannerBarcode.codeDelegate = self
//        scannerBarcode.errorDelegate = self
//        scannerBarcode.dismissalDelegate = self
//
//        self.navigationController?.pushViewController(scannerBarcode, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listArrayMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellMenu.getIdentifier() , for: indexPath) as! CellMenu
        guard listArrayMenu[indexPath.row] != "" else {
            cell.showButtons()
            cell.delegateCell = self
            return cell
        }
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
        case SString.logout :
            SharedData.instance.removeData()
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            parentNavigationController = nil
            parentNavigationController = UINavigationController(rootViewController: LoginVC())
            appDelegate.window?.rootViewController = parentNavigationController
            appDelegate.window?.makeKeyAndVisible()
        default:
            break
        }
    }
    
    @objc private func actionCloseScanner () {
        scannerBarcode?.navigationController?.popViewController(animated: true )
    }
    
}

extension MenuVC : BarcodeScannerCodeDelegate , BarcodeScannerErrorDelegate ,
                           BarcodeScannerDismissalDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        if controller.view.tag == TAG_CHECKIN {
            print(code)
            self.presenter?.removeCheckout(barcode: code)
        }else if controller.view.tag == TAG_CHECKOUT {
            print(code)
            self.presenter?.addCheckout(barcode: code)
        }
        
        controller.reset()
        scannerDidDismiss(controller)
    }
    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
        print(error)
    }
    
    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
        controller.navigationController?.popViewController(animated: true)
    }
}

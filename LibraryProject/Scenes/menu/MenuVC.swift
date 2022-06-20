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
    
//    var listArrayMenu : [String] = [
//        SString.changePassword ,
//        SString.profile ,
//        SString.checkoutList ,
//        "" ,
//        SString.holdList ,
//        SString.suggestions ,
//        SharedData.instance.getLangauge().contains( LanguageEnum.en.rawValue) ? "العربية" : "English" ,
//        SString.logout
//    ]
    
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
        
        
       // self.presenter?.addCheckout(barcode: "8230")
        scannerBarcode = BarcodeScannerViewController()
        
        let l = UIButton()
        l.setTitle(SString.close , for: .normal)
        l.setTitleColor(.red , for: .normal)
        l.addTarget(self , action: #selector(actionCloseScanner), for: .touchUpInside)
        
        scannerBarcode.view.addSubview(l)
        l.anchor(top: scannerBarcode.view.safeAreaLayoutGuide.topAnchor , leading: scannerBarcode.view.leadingAnchor, paddingTop: 8, paddingLeft: 16 )
        
        scannerBarcode.view.tag = TAG_CHECKOUT
        scannerBarcode.isOneTimeSearch = true
        scannerBarcode.codeDelegate = self
        scannerBarcode.errorDelegate = self
        scannerBarcode.dismissalDelegate = self

        self.navigationController?.pushViewController(scannerBarcode, animated: true)
//        self.createALetWithText(code: "342")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.getListMenu().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellMenu.getIdentifier() , for: indexPath) as! CellMenu
        guard presenter?.getListMenu()[indexPath.row] != "" else {
            cell.showButtons()
            cell.delegateCell = self
            return cell
        }
        cell.setTitle(title: presenter?.getListMenu()[indexPath.row]  )
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch presenter?.getListMenu()[indexPath.row] {
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
        case "العربية" :
            changeLanguage()
        case "English":
            changeLanguage()
        case SString.logout :
            SharedData.instance.removeData()
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            parentNavigationController = UINavigationController()
            parentNavigationController?.navigationBar.isHidden = true
            parentNavigationController?.navigationBar.barTintColor = UIColor.orange
            parentNavigationController?.navigationBar.tintColor = UIColor.white
            parentNavigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
            let vc = LoginVC()
            parentNavigationController?.viewControllers = [vc]
            appDelegate.window?.rootViewController = parentNavigationController
            appDelegate.window?.makeKeyAndVisible()
        case SString.login :
            self.navigationController?.pushViewController(LoginVC(), animated: true)
        default:
            break
        }
    }
    
    @objc private func actionCloseScanner () {
        scannerBarcode?.navigationController?.popViewController(animated: true )
    }
    
    func changeLanguage() {
//        var lang = "en"
        if SharedData.instance.getLangauge().contains( LanguageEnum.en.rawValue) {
            SharedData.instance.setLangauge(lang: .ar)
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }else {
            SharedData.instance.setLangauge(lang: .en)
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }

        restartApp(vc: MainLayoutTapsRouter.createModule())
        NotificationCenter.default.post(name: Notification.Name("languageChanged"), object: nil)
    }
    
    func restartApp (vc: UIViewController) {
        
        let viewController = vc
        let navCtrl = UINavigationController(rootViewController: viewController)
        navCtrl.navigationBar.isHidden = true
        guard
                let window = UIApplication.shared.keyWindow,
                let rootViewController = window.rootViewController
                else {
            return
        }

        navCtrl.view.frame = rootViewController.view.frame
        navCtrl.view.layoutIfNeeded()

        window.rootViewController = navCtrl
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
           // self.presenter?.addCheckout(barcode: code)
            self.createALetWithText(code: code)
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
    
    private func createALetWithText (code : String) {
        
        mainView.alertView = UIAlertController(title: nil , message: SString.SelectDeliveryDate, preferredStyle: .alert)
        mainView.alertView?.addTextField { (textField) in
            textField.placeholder = SString.SelectDeliveryDate
            textField.text = Date().getDateString(formate: "yyyy-MM-dd", afterPeriodOfMonths: 0)
            textField.inputView = self.mainView.datePicker
            self.mainView.datePicker.addTarget(self, action: #selector(self.handleDatePicker), for: .valueChanged)
        }
        
        mainView.alertView?.addAction(UIAlertAction(title: SString.submit , style: .default, handler: { [weak self] (_) in
            guard let textField = self?.mainView.alertView?.textFields?[0], let userText = textField.text else { return }
           // print("User text: \(userText)")
            guard userText != "" else {
                return
            }
            self?.presenter?.addCheckout(barcode: code , date: userText)
        }))
        
        mainView.alertView?.addAction(UIAlertAction(title: SString.cancel , style: .default, handler: nil))
        guard let alert = mainView.alertView else {
            return
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func handleDatePicker () {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.mainView.alertView?.textFields?[0].text = dateFormatter.string(from: mainView.datePicker.date)
    }
    
}

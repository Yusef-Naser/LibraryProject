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
        
        mainView.setUserID(id: "UserID: \(SharedData.instance.getUserID())")
        mainView.setUserName(name: SharedData.instance.getUserName())
        
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
        guard presenter?.getListMenu()[indexPath.row].0 != "" else {
            cell.showButtons()
            cell.delegateCell = self
            return cell
        }
        cell.setTitle(title: presenter?.getListMenu()[indexPath.row].0 , icon: presenter?.getListMenu()[indexPath.row].1  )
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch presenter?.getListMenu()[indexPath.row].0 {
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.actionCloseScanner()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.createALetWithText(code: code)
            }
            
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
        
        mainView.alertView = UIAlertController(title: nil , message: "\(SString.SelectDeliveryDate)\n(\(code))", preferredStyle: .alert)
        mainView.alertView?.addTextField { (textField) in
            textField.tag = 1
            textField.placeholder = SString.SelectDeliveryDate
            textField.text = Date().getDateString(formate: "yyyy-MM-dd", afterPeriodOfMonths: 0)
            textField.inputView = self.mainView.datePicker
            self.mainView.datePicker.addTarget(self, action: #selector(self.handleDatePicker), for: .valueChanged)
        }
        
        mainView.alertView?.addTextField { (textField) in
            textField.tag = 2
            textField.placeholder = SString.cardNumber
            textField.text = "\(SharedData.instance.getUserName() ?? "")"
        }
        
        mainView.alertView?.addAction(UIAlertAction(title: SString.submit , style: .default, handler: { [weak self] (_) in
            guard let textField = self?.mainView.alertView?.textFields?.filter({$0.tag == 1}).first, let date = textField.text else { return }
            guard let textField = self?.mainView.alertView?.textFields?.filter({$0.tag == 2}).first, let cardNumber = textField.text else { return }
           // print("User text: \(userText)")
            guard date != "" && cardNumber != "" else {
                self?.showMessage(SString.pleaseAddDateAndCardNumber)
                return
            }
            self?.presenter?.addCheckout(barcode: code , date: date, cardNumber: cardNumber)
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
        self.mainView.alertView?.textFields?.filter({$0.tag == 1}).first?.text = dateFormatter.string(from: mainView.datePicker.date)
    }
    
}

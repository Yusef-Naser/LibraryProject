//
//  filterView.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//

import UIKit

class FilterView : UIView {
    
    var completionSelectPicker : ( ( String)->Void )?
        
    let pickerViewFilter : UIPickerView = {
        let l = UIPickerView()
        l.backgroundColor = .white
        return l
    }()
    
    private var selectedString = ""
    
    let arrayFilter = [
        "Title" ,
        "Author" ,
        "Subject" ,
        "ISBN" ,
        "ISSN" ,
        "Series" ,
        "Call number"
    ]
    
    private let iconFilter : UIImageView = {
        let l = UIImageView()
        l.image = #imageLiteral(resourceName: "filter")
        return l
    }()
    
    lazy var labelFilter : UILabel = {
        let l = UILabel()
        l.isEnabled = false
        l.text = SString.filter
        return l
    }()
    
    lazy var toolbar : UIToolbar = {
        let l = UIToolbar()
        
//        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width , height: 50 ))
        l.barStyle = .default
        l.items = [UIBarButtonItem(title: SString.done , style: .done , target: self , action: #selector(actionDoneToolBar))]
        l.sizeToFit()
        
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initViews()
    }
    
    private func initViews () {
        addViews()
        self.backgroundColor = Colors.grayColors
        self.layer.cornerRadius = 10
        pickerViewFilter.delegate = self
        pickerViewFilter.dataSource = self
        
        labelFilter.text = arrayFilter[0]
        selectedString = arrayFilter[0]
        //self.isUserInteractionEnabled = true
    }
    
    private func addViews () {
        
        addSubview(labelFilter)
        addSubview(iconFilter)
        
        iconFilter.anchor(top: topAnchor , bottom: bottomAnchor , trailing: trailingAnchor , paddingTop: 8 , paddingBottom: 8 , paddingRight: 8 , width: 25 , height: 50 )
        labelFilter.anchor(top: topAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: iconFilter.leadingAnchor , paddingTop: 8, paddingLeft: 8 , paddingBottom: 8 , paddingRight: 8 )
        
    }
    
}


extension FilterView : UIPickerViewDelegate , UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        arrayFilter.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayFilter[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        labelFilter.text = arrayFilter[row]
        selectedString = arrayFilter[row]
        
    }
    
    @objc private func actionDoneToolBar () {
        pickerViewFilter.removeFromSuperview()
        toolbar.removeFromSuperview()
        completionSelectPicker?(selectedString)
    }
    
}

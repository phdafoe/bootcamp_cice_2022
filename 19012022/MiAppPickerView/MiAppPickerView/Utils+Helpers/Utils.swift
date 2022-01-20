//
//  Utils.swift
//  MiAppPickerView
//
//  Created by Andres Felipe Ocampo Eljaiek on 20/1/22.
//

import Foundation
import UIKit

class Utils {
    
    // Patron Singleton
    static let shared = Utils()
    
    func configuracionPickerView(tag: Int,
                                 delegate: UIPickerViewDelegate,
                                 dataSource: UIPickerViewDataSource,
                                 textField: UITextField,
                                 dataArray: [String]) {
        
        let pickerView = UIPickerView()
        pickerView.delegate = delegate
        pickerView.dataSource = dataSource
        pickerView.tag = tag
        textField.inputView = pickerView
        textField.text = dataArray[0]
    }
    
}


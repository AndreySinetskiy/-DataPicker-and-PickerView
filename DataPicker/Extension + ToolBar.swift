//
//  Extension + ToolBar.swift
//  DataPicker
//
//  Created by 1 on 01.10.2021.
//

import UIKit

extension ViewController {
    func createToolBar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        textField.inputAccessoryView = toolBar
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissToolBar))
        let flexBotton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                         target: nil,
                                         action: nil)
        
        toolBar.items = [flexBotton, doneButton]
        toolBar.isUserInteractionEnabled = true
        
        toolBar.tintColor = .yellow
        toolBar.barTintColor = .black
    }
}

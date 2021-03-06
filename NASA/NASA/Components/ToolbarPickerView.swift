//
//  ToolbarPickerView.swift
//  NASA
//
//  Created by Matheus Pacheco Fusco on 13/02/21.
//  Copyright © 2021 Matheus Pacheco Fusco. All rights reserved.
//

import Foundation
import UIKit

protocol ToolbarPickerViewDelegate: class {
    func cancelButtonClicked(pickerView: ToolbarPickerView)
    func doneButtonClicked(pickerView: ToolbarPickerView)
}

class ToolbarPickerView: UIPickerView {

    private(set) var toolbar: UIToolbar?
    open weak var toolbarDelegate: ToolbarPickerViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.prepareLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.prepareLayout()
    }

    private func prepareLayout() {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .black
        toolBar.sizeToFit()

        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelButtonClicked))
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneButtonClicked))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        self.toolbar = toolBar
    }

    @objc func doneButtonClicked() {
        self.toolbarDelegate?.doneButtonClicked(pickerView: self)
    }
    
    @objc func cancelButtonClicked() {
        self.toolbarDelegate?.cancelButtonClicked(pickerView: self)
    }
}

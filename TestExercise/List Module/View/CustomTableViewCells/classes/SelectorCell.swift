//
//  SelectorCell.swift
//  TestExercise
//
//  Created by Nikita Galaganov on 28.09.2020.
//

import Foundation
import UIKit
import TinyConstraints

class SelectorCell: UITableViewCell{
    
    let selectorView: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    private let numOfComponents = 1
    var dataSource: [Variant]?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(selectorView)
        
        selectorView.edgesToSuperview(insets: .top(10) + .left(10) + .right(10) + .bottom(10))
        selectorView.delegate = self
        selectorView.dataSource = self
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
}

extension SelectorCell: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return numOfComponents
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource?[row].text ?? "empty"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
    }
}

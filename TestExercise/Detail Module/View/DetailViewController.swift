//
//  DetailViewController.swift
//  TestExercise
//
//  Created by Nikita Galaganov on 29.09.2020.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    private let numOfComponents = 1
    
    var presenter: DetailViewPresenterProtocol!
    
    var dataToSet: Datum!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        presenter.setDataObject()
        navigationItem.title = dataToSet.data.text
    }
    
    private func addText(){
        let dataLabel:UILabel = {
            let label = UILabel()
            label.text = dataToSet.data.text
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.textAlignment = .center
            return label
        }()
        
        view.addSubview(dataLabel)
        
        dataLabel.centerInSuperview()
    }
    
    private func addImage(){
        let dataLabel:UILabel = {
            let label = UILabel()
            label.text = dataToSet.data.text
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.textAlignment = .center
            return label
        }()
        
        let logoImageView:UIImageView = {
            let img = UIImageView()
            img.contentMode = .scaleAspectFit
            img.translatesAutoresizingMaskIntoConstraints = false
            img.clipsToBounds = true
            img.kf.setImage(with: URL(string: (dataToSet?.data.url)!), placeholder: UIImage(named: "placeholder"))
            return img
        }()
        
        view.addSubview(dataLabel)
        view.addSubview(logoImageView)
        
        dataLabel.centerInSuperview()
        logoImageView.topToBottom(of: dataLabel)
        logoImageView.size(CGSize(width: 200, height: 200))
        logoImageView.centerXToSuperview()
    }
    
    private func addSelector(){
        let selectorView: UIPickerView = {
            let picker = UIPickerView()
            return picker
        }()
        
        view.addSubview(selectorView)
        
        selectorView.dataSource = self
        selectorView.delegate = self
        
        selectorView.centerInSuperview()
    }
}

extension DetailViewController: DetailViewProtocol{
    func setDataObject(dataObject: Datum?) {
        dataToSet = dataObject
        switch dataObject?.name {
        case DataType.text.rawValue:
            addText()
        case DataType.picture.rawValue:
            addImage()
        case DataType.selector.rawValue:
            addSelector()
        default:
            print("default worked")
        }
    }
}

extension DetailViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return numOfComponents
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataToSet.data.variants?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataToSet.data.variants?[row].text ?? "empty"
    }
}

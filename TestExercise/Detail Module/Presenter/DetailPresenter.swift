//
//  DetailPresenter.swift
//  TestExercise
//
//  Created by Nikita Galaganov on 29.09.2020.
//

import Foundation
import UIKit

protocol DetailViewProtocol: class{
    func setDataObject(dataObject: Datum?)
}

protocol DetailViewPresenterProtocol: class{
    init(view: DetailViewProtocol, dataObject: Datum?)
    func setDataObject()
}

class DetailPresenter: DetailViewPresenterProtocol{
    weak var view: DetailViewProtocol?
    var dataObject: Datum?
    
    required init(view: DetailViewProtocol, dataObject: Datum?) {
        self.dataObject = dataObject
        self.view = view
    }
    
    public func setDataObject() {
        self.view?.setDataObject(dataObject: dataObject)
    }
}

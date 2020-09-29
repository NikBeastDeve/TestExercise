//
//  ModuleBuilder.swift
//  TestExercise
//
//  Created by Nikita Galaganov on 28.09.2020.
//

import UIKit

protocol Builder {
    static func createListModule() -> UIViewController
    static func createDetailModule(dataObject: Datum?) -> UIViewController
}

class  ModelBuilder: Builder {
    static func createListModule() -> UIViewController {
        let view = ListViewController()
        let networkService = NetworkService()
        let presenter = ListPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    static func createDetailModule(dataObject: Datum?) -> UIViewController{
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, dataObject: dataObject)
        view.presenter = presenter
        return view
    }
}

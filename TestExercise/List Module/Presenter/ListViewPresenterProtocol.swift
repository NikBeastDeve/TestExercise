//
//  ListViewPresenterProtocol.swift
//  TestExercise
//
//  Created by Nikita Galaganov on 28.09.2020.
//

import Foundation

protocol ListViewProtocol: class {
    func succes()
    func failure(error: Error)
}

protocol ListViewPresenterProtocol: class {
    init(view: ListViewProtocol, networkService: NetworkServiceProtocol)
    func getData()
    var resultData: [Datum]? {get set}
}

class ListPresenter: ListViewPresenterProtocol {
    weak var view: ListViewProtocol?
    let networkService: NetworkServiceProtocol!
    var resultData: [Datum]?
    
    required init(view: ListViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getData()
    }
    
    func getData() {
        networkService.getData { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.resultData = data
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                default:
                    print("default worked")
                }
            }
        }
    }
}

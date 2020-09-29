//
//  NetworkService.swift
//  TestExercise
//
//  Created by Nikita Galaganov on 28.09.2020.
//

import Foundation

protocol NetworkServiceProtocol {
    func getData(completion: @escaping (Result<[Datum], Error>?) -> ())
}

class NetworkService: NetworkServiceProtocol {
    func getData(completion: @escaping (Result<[Datum], Error>?) -> ()) {
        let urlString = "https://pryaniky.com/static/json/sample.json"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url){ data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do{
                let obj = try JSONDecoder().decode(ListDataType.self, from: data!)
                var resultArray: [Datum] = []
                for name in obj.view{
                    for res in obj.data{
                        if res.name == name{
                            resultArray.append(res)
                        }
                    }
                }
                
                completion(.success(resultArray))
            }catch{
                completion(.failure(error))
            }
        }.resume()
    }
}

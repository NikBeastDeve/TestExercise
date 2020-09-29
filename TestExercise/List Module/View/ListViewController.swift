//
//  ListViewController.swift
//  TestExercise
//
//  Created by Nikita Galaganov on 28.09.2020.
//

import Foundation
import UIKit

class ListViewController: UIViewController {
    
    let cellId = "cell"
    let tableView = UITableView()
    
    var presenter: ListViewPresenterProtocol!
    var safeArea: UILayoutGuide!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset.top = 20
        navigationItem.title = "Test App"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        setupTableView()
      }
    
    private func setupTableView() {
        registerCells()

        view.addSubview(tableView)
        tableView.edgesToSuperview()
    }
    
    private func registerCells() {
        tableView.register(TextCell.self, forCellReuseIdentifier: "textCell")
        tableView.register(ImageCell.self, forCellReuseIdentifier: "pictureCell")
        tableView.register(SelectorCell.self, forCellReuseIdentifier: "selectorCell")
    }
}

extension ListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.resultData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = presenter.resultData?[indexPath.row]
        switch data?.name{
        case DataType.text.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath) as! TextCell
            cell.dataLabel.text = data?.data.text
            return cell
        case DataType.picture.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "pictureCell", for: indexPath) as! ImageCell
            cell.dataLabel.text = data?.data.text
            cell.logoImageView.kf.setImage(with: URL(string: (data?.data.url)!))
            return cell
        case DataType.selector.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "selectorCell", for: indexPath) as! SelectorCell
            cell.dataSource = data?.data.variants
            return cell
        default:
            print("default worked")
            return UITableViewCell()
        }
    }
}

extension ListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("")
        let dObject = presenter.resultData?[indexPath.row]
        let detailVC = ModelBuilder.createDetailModule(dataObject: dObject)
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ListViewController: ListViewProtocol{
    func succes() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}



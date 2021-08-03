//
//  FinishedOperationsViewController.swift
//  VA Computing Technical Task
//
//  Created by Admin1 on 02/08/2021.
//  Copyright © 2021 Admin1. All rights reserved.
//

import UIKit

class FinishedOperationsViewController: UIViewController , FinishedOperationsViewProtocol {
    
    var presenter: FinishedOperationsPresenter!
        
    @IBOutlet weak var operationsTable: UITableView!
    @IBOutlet weak var noOperationsLabel: UILabel!
    
    let cellName = "OperationTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
   
    func setupTableView() {
        let nib = UINib(nibName: cellName, bundle: Bundle.main)
        
        operationsTable.delegate = self
        operationsTable.dataSource = self
        operationsTable.register(nib, forCellReuseIdentifier: cellName)
    }
    
    func reloadData() {
        operationsTable.reloadData()
    }
    
    func showTableView() {
        operationsTable.isHidden = false
        noOperationsLabel.isHidden = true
    }
    
    func hideTableView() {
        operationsTable.isHidden = true
        noOperationsLabel.isHidden = false
    }
    
}

extension FinishedOperationsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberFinished
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! OperationTableViewCell
        presenter.configure(cell: cell, indexPath: indexPath)
        return cell
    }
   
}

//
//  OperationsViewController.swift
//  VA Computing Technical Task
//
//  Created by Admin1 on 01/08/2021.
//  Copyright © 2021 Admin1. All rights reserved.
//

import UIKit

class OperationsViewController: UIViewController, OperationsViewProtocol {
    
    var presenter: OperationsPresenter!
        
    @IBOutlet weak var operationsTable: UITableView!
//    @IBOutlet weak var finishedOperationsTable: UITableView!
    @IBOutlet weak var addOperation: UIButton!
    @IBOutlet weak var noOperationsLabel: UILabel!
    @IBOutlet weak var showLogsBtn: RedRoundedButton!
    
    let cellName = "OperationTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    @IBAction func addOperationAction(_ sender: UIButton) {
        presenter.navigateToQuestionVC()
    }
    
    @IBAction func showLogsAction(_ sender: UIButton) {
        presenter.navigateToFinished()
    }
    
    func setupTableView() {
        let nib = UINib(nibName: cellName, bundle: Bundle.main)
        
        operationsTable.delegate = self
        operationsTable.dataSource = self
        operationsTable.register(nib, forCellReuseIdentifier: cellName)
    }
    
    func reloadData() {
        operationsTable.reloadData()
//        finishedOperationsTable.reloadData()
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

extension OperationsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfPending
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! OperationTableViewCell
        presenter.configure(cell: cell, indexPath: indexPath)
        return cell
    }
   
}

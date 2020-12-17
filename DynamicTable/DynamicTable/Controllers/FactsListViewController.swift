//
//  FactsListViewController.swift
//  DynamicTable
//
//  Created by Ankita  on 16/12/20.
//  Copyright © 2020 Ankita . All rights reserved.
//

import UIKit

class FactsListViewController: UIViewController {
   private var viewModel: FactsViewModel!
   private var FactsModel: FactModel!


//MARK: Setup UI Components
    
    private lazy var factsTable : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 10
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView(frame: .zero)

        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpFactsTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel = FactsViewModel(delegate: self)
        viewModel.getFactsData()
        
    }
    
    func setUpFactsTable() {
        view.addSubview(factsTable)
        factsTable.dataSource = self
        factsTable.translatesAutoresizingMaskIntoConstraints = false
        factsTable.register(FactsListTableViewCell.self, forCellReuseIdentifier: "FactsCell")
        factsTable.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        factsTable.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        factsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        factsTable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

    }
    

}

extension FactsListViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return FactsModel?.facts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FactsCell", for: indexPath) as! FactsListTableViewCell
        cell.layoutMargins = UIEdgeInsets.zero
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: Call Back on data fetch completion
extension FactsListViewController: DataFetchProtocol {
    
    /// Callback when data from api is recieved  successfully
    /// - Parameter result: Fact Model  class object is returned
    
    func onDataFetchSuccessfullyCompleted(with result: FactModel) {
        FactsModel = result
        factsTable.reloadData()
    }
    
    /// Callback when api is failed
    /// - Parameter reason: error message iin String format
    func onDataFetchFailed(with reason: String) {
        
    }
  
  
}

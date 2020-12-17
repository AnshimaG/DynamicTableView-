//
//  FactsListViewController.swift
//  DynamicTable
//
//  Created by Ankita  on 16/12/20.
//  Copyright © 2020 Ankita . All rights reserved.
//

import UIKit

class FactsListViewController: UIViewController {
   var viewModel: FactsViewModel!
   var factsModel: FactModel!
   var refreshControl: UIRefreshControl?



//MARK: Setup UI Components
    
     lazy var factsTable : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = CGFloat(Height.factTableEstimated)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView(frame: .zero)

        return tableView
    }()
    
    lazy var messageLabel : UILabel = {
      let label = UILabel()
      label.textColor = .gray
      label.font = UIFont(name: Font.regular, size: 18)
      label.textAlignment = .center
      label.numberOfLines = 0
      label.sizeToFit()
      return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpFactsTable()
        setUpRrefreshControl()
        setUpEmptyOrErrorLabel()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel = FactsViewModel(delegate: self)
        checkNetworkConnectivity()
        // Set the navigation Title
        viewModel.updateNavigationTitle = {[weak self] () in
            guard let self = self else { return }
            self.navigationItem.title = self.viewModel.navTitle
        }
        
        //hide  refreshControl, when response is received
        viewModel.updateRefreshControl = { [weak self] () in
          guard let self = self, let refreshControl = self.refreshControl else { return }
          refreshControl.endRefreshing()
        }
        
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
        factsTable.refreshControl = refreshControl


    }
    
    private func setUpEmptyOrErrorLabel() {
        factsTable.backgroundView = messageLabel
        messageLabel.text = Message.initialLoading
    }
    private func setUpRrefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        refreshControl?.attributedTitle = NSAttributedString(string: Message.pullToRefresh)
        factsTable.refreshControl = refreshControl
    }
    
    @objc func refreshData(_ refreshControl: UIRefreshControl) {
        checkNetworkConnectivity()
    }
    
    func checkNetworkConnectivity() {
        let status = Reach().connectionStatus()
    
        switch status {
        case .unknown, .offline:
           factsTable.backgroundView = messageLabel
           messageLabel.text = Message.internetConnectivity
        default:
            viewModel.getFactsData()
        }

    }

}

extension FactsListViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return factsModel?.facts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FactsCell", for: indexPath) as! FactsListTableViewCell
        cell.layoutMargins = UIEdgeInsets.zero
        cell.selectionStyle = .none
        cell.facts = factsModel?.facts?[indexPath.row]

        return cell
    }
}

// MARK: Call Back on data fetch completion
extension FactsListViewController: DataFetchProtocol {
    
    /// Callback when data from api is recieved  successfully
    /// - Parameter result: Fact Model  class object is returned
    
    func onDataFetchSuccessfullyCompleted(with result: FactModel) {
        factsModel = result
        factsTable.reloadData()
    }
    
    /// Callback when api is failed
    /// - Parameter reason: error message iin String format
    func onDataFetchFailed(with reason: String) {
        factsTable.backgroundView = messageLabel
        messageLabel.text = reason
        
    }
  
  
}

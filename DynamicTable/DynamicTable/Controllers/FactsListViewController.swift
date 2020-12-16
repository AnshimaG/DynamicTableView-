//
//  FactsListViewController.swift
//  DynamicTable
//
//  Created by Ankita  on 16/12/20.
//  Copyright © 2020 Ankita . All rights reserved.
//

import UIKit

class FactsListViewController: UIViewController {
   
//MARK: Setup UI Components
    private lazy var FactsTable : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 10
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView(frame: .zero)

        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setUpFactsTable() {
        view.addSubview(FactsTable)
        FactsTable.dataSource = self

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FactsListViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   // return factsModel?.facts?.count ?? 0
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FactsCell", for: indexPath) as! FactsListTableViewCell
        cell.layoutMargins = UIEdgeInsets.zero
         cell.selectionStyle = .none
        return cell
    }
}

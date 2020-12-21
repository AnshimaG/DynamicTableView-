//
//  FactsListTableViewCell.swift
//  DynamicTable
//
//  Created by Ankita  on 16/12/20.
//  Copyright © 2020 Ankita . All rights reserved.
//

import UIKit

class FactsListTableViewCell: UITableViewCell {
    lazy var factView = {
        return FactCellView()
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(factView)
        
        factView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(greaterThanOrEqualToConstant: CGFloat(Size.image.height)),
            factView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            factView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            factView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            factView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var facts: Facts? {
        didSet {
            guard let facts = facts else {
                return
            }
            factView.titleText = facts.title
            factView.descriptionText = facts.description
            factView.setImage(imageUrl: facts.imageUrl, placeHolder: "placeholder")
        }
    }
    
}

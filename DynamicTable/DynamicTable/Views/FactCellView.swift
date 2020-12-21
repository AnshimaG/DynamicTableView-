//
//  FactCellView.swift
//  DynamicTable
//
//  Created by Ankita  on 16/12/20.
//  Copyright © 2020 Ankita . All rights reserved.
//

import UIKit
import SDWebImage

final class FactCellView: UIView {
    
    //MARK: CellView
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Font.medium, size: 15.0)
        label.textColor = UIColor.appColor(.labelTextColor)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var descriptionLabel : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont(name: Font.neue, size: 15.0)
        label.textColor = UIColor.appColor(.labelTextColor)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Adding title and description label in vertical stack view
    private lazy var verticalTextStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.titleLabel, self.descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = CGFloat(Height.margin)
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // Adding Image view and Verticalstack view in a horizontal stack view to arrange components side by side
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [self.imageView, self.verticalTextStackView]
        )
        stackView.axis = .horizontal
        stackView.spacing = CGFloat(2 * Height.margin)
        stackView.alignment = .top
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private func addSubviews() {
        addSubview(stackView)
        setupConstraints()
    }
    
    // Add constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: CGFloat(Size.image.width)),
            imageView.heightAnchor.constraint(equalToConstant: CGFloat(Size.image.height)),
            stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
        ])
    }
    
    // MARK: Init
    override init (frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
    }
    
}
//MARK: Set Data in Cell
extension FactCellView {
    func setImage(imageUrl: String?, placeHolder: String) {
        DispatchQueue.global().async { [weak self] in
            guard let self  = self else { return }
            self.imageView.sd_setImage(with: URL(string: imageUrl ?? ""), placeholderImage: UIImage(named: "placeholder"))
        }
    }
    
    var titleText: String? {
        get {
            return titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    var descriptionText: String? {
        get {
            return descriptionLabel.text
        }
        set {
            descriptionLabel.text = newValue
        }
    }
}

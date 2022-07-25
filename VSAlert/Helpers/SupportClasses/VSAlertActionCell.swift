//
//  VSAlertActionCell.swift
//  VSAlert
//
//  Created by Vatsal Shukla on 25/07/22.
//

import UIKit

class VSAlertActionCell: UICollectionViewCell {
    static let kSpan:CGFloat = 8.0
    
    //MARK: - OUTLETS
    private lazy var lbl:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    //MARK: - PROPERTIES
    var action:VSAlertAction! {
        didSet {
            self.lbl.textColor = self.action.style.forgroundColor
            self.lbl.text = self.action.title
            self.contentView.backgroundColor = self.action.style.backgroundColor
            self.contentView.layer.cornerRadius = self.action.style.cornerRadius
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(lbl)
        NSLayoutConstraint.activate([
            lbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: VSAlertActionCell.kSpan),
            lbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: VSAlertActionCell.kSpan),
            lbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -VSAlertActionCell.kSpan),
            lbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -VSAlertActionCell.kSpan),
        ])
    }
}


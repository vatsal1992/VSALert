//
//  VSTextField.swift
//  VSAlert
//
//  Created by Vatsal Shukla on 16/10/22.
//

import UIKit

class VSTextField: UIView {
    //MARK: - OUTLETS
    private lazy var lbl:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.lineBreakMode = .byWordWrapping
        lbl.font = self.configuration.messageFont
        return lbl
    }()
    
    private lazy var tf:UITextField = {
        let tf = UITextField(frame: .zero)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.font = self.configuration.messageFont
        return tf
    }()
    
    //MARK: - PROPERTIES
    private(set) var configuration:VSAlertConfiguration = .config
    private(set) var delegate:UITextFieldDelegate? {
        didSet {
            self.tf.delegate = self.delegate
        }
    }
    var placeholder:String? {
        didSet {
            lbl.text = placeholder
        }
    }
    var attributedPlaceholder:NSAttributedString? {
        didSet {
            lbl.attributedText = attributedPlaceholder
        }
    }
    var inputText:String? {
        set {
            tf.text = newValue
        }
        get {
            return tf.text
        }
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupUI()
    }
    
    //MARK: - SetupUI
    func setupUI() {
        addSubview(lbl)
        addSubview(tf)
        NSLayoutConstraint.activate([
            lbl.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            lbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            lbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            lbl.heightAnchor.constraint(greaterThanOrEqualToConstant: 14),
            
            tf.topAnchor.constraint(equalTo: lbl.bottomAnchor, constant: 4),
            tf.leadingAnchor.constraint(equalTo: lbl.leadingAnchor),
            tf.trailingAnchor.constraint(equalTo: lbl.trailingAnchor),
            tf.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            tf.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}

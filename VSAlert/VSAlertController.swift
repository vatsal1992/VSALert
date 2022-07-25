//
//  VSAlertController.swift
//  VSAlert
//
//  Created by Vatsal Shukla on 25/07/22.
//

import UIKit


public class VSAlertController: UIViewController {
    //MARK: OUTLETS
    private lazy var contentView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = self.configuration.cornerRadius
        view.backgroundColor = self.configuration.alertBackgroundColor
        view.addSubview(stackView)
        view.isHidden = true
        view.alpha = 0
        return view
    }()
    
    private lazy var activity:UIActivityIndicatorView = {
        let obj = UIActivityIndicatorView(style: .medium)
        obj.color = self.configuration.titleColor
        obj.hidesWhenStopped = true
        return obj
    }()
    
    private lazy var lblTitle:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = self.configuration.titleColor
        lbl.font = self.configuration.titleFont
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    private lazy var lblMessage:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = self.configuration.messageColor
        lbl.font = self.configuration.messageFont
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    private lazy var clnActionButton:DynamicHeightCollectionView = {
        let layout = UICollectionViewFlowLayout()

        let cln = DynamicHeightCollectionView(frame: .zero, collectionViewLayout: layout)
        cln.translatesAutoresizingMaskIntoConstraints = false
        cln.register(VSAlertActionCell.self, forCellWithReuseIdentifier: VSAlertActionCell.id)
        cln.isScrollEnabled = false
        cln.showsVerticalScrollIndicator = false
        cln.showsHorizontalScrollIndicator = false
        cln.contentInset = UIEdgeInsets(top: 0, left: span, bottom: 0, right: span)
        cln.backgroundColor = .clear
        return cln
    }()
    
    private lazy var stackView:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [activity, lblTitle, lblMessage, clnActionButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 8
        return stack
    }()
    
    private lazy var control:UIControl = {
        let ctrl = UIControl(frame: .zero)
        ctrl.translatesAutoresizingMaskIntoConstraints = false
        return ctrl
    }()
    
    //MARK: PROPERTIES
    private let span:CGFloat = 16
    private var actionHeightConstraint:NSLayoutConstraint!
    private(set) var configuration:VSAlertConfiguration = .config
    private(set) var alertTitle:String?
    private(set) var alertMessage:String?
    private(set) var actions:[VSAlertAction] = []
    
    //MARK: - Init
    public init(title t:String,message m:String,configuration config:VSAlertConfiguration = .config) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = t
        self.alertMessage = m
        self.configuration = config
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    //MARK: - ViewController's LifeCycle
    public override func loadView() {
        super.loadView()
        self.setupUI()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.contentView.backgroundColor = self.configuration.alertBackgroundColor
        self.configuration.showActivity ? self.activity.startAnimating() : self.activity.stopAnimating()
        self.clnActionButton.isHidden = self.actions.count == 0 ? true : false
        
        if self.actions.count == 0 {
            self.control.addTarget(self, action: #selector(self.clickToDismiss), for: .touchUpInside)
        } else {
            self.clnActionButton.delegate = self
            self.clnActionButton.dataSource = self
            var height:CGFloat = (35 * CGFloat(self.actions.count)) + (span * CGFloat(self.actions.count-1))
            if self.actions.count < 3 {
                height = 35
            }
            self.actionHeightConstraint.constant = height
        }
        
        if let t = self.alertTitle {
            self.lblTitle.isHidden = false
            self.lblTitle.text = t
        }else {
            self.lblTitle.isHidden = true
        }
        
        if let t = self.alertMessage {
            self.lblMessage.isHidden = false
            self.lblMessage.text = t
        }else {
            self.lblMessage.isHidden = true
        }
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            UIView.transition(with: self.contentView, duration: 0.25, options: .curveEaseIn) {
                self.contentView.isHidden = false
                self.contentView.alpha = 1
            } completion: { _ in
                
            }

        }
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.setupCollectionView()
            self.contentView.layer.shadowPath = UIBezierPath(rect: self.contentView.bounds).cgPath
            self.contentView.layer.shadowRadius = 5
            self.contentView.layer.shadowOffset = .zero
            self.contentView.layer.shadowOpacity = 0.3
        }
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    deinit {
    }
}

//MARK: - SetupUI
extension VSAlertController {
    private func setupUI() {
        view.addSubview(control)
        view.addSubview(contentView)
        self.setupConstraints()
    }
    
    private func setupConstraints() {
        self.actionHeightConstraint = self.clnActionButton.heightAnchor.constraint(equalToConstant: 35)
        NSLayoutConstraint.activate([
            control.topAnchor.constraint(equalTo: view.topAnchor),
            control.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            control.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            control.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: span),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: span),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -span),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -span),
            
            actionHeightConstraint,
        ])
    }
    
    private func setupCollectionView() {
        if self.actions.isEmpty { return }
        let count = self.actions.count
        var buttonWidth:CGFloat = span
        let buttonHeight:CGFloat = 35
        if count == 2 {
            buttonWidth = (contentView.bounds.width/2) - (span * CGFloat(count+1))
        }else {
            buttonWidth = (contentView.bounds.width - (span*4))
        }
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: buttonWidth, height: buttonHeight)
        layout.minimumLineSpacing = span
        layout.minimumInteritemSpacing = span
        self.clnActionButton.setCollectionViewLayout(layout, animated: false)
    }
}

//MARK: - Public Functions
extension VSAlertController {
    public func addAction(_ action:VSAlertAction) {
        self.actions.append(action)
    }
    
    public func present(on vc:UIViewController,completion callback:(()->Void)?) {
        self.modalPresentationStyle = .overCurrentContext
        if vc.isKind(of: UINavigationController.self) {
            (vc as! UINavigationController).present(self, animated: true, completion: callback)
        }else {
            if let nav = vc.navigationController {
                nav.present(self, animated: true, completion: callback)
            }else {
                vc.present(self, animated: true, completion: callback)
            }
        }
    }
}


//MARK: - Private Functions
extension VSAlertController {
    @objc private func clickToDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
}


//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension VSAlertController : UICollectionViewDelegate, UICollectionViewDataSource {
    //MARK: - UICollectionViewDataSource
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.actions.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = VSAlertActionCell.reuseCell(on: collectionView, at: indexPath)
        cell.action = self.actions[indexPath.item]
        return cell
    }
    
    //MARK: - UICollectionViewDelegate
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        self.dismiss(animated: true) {
            self.actions[indexPath.item].completion?(self.actions[indexPath.item])
        }
    }
}

